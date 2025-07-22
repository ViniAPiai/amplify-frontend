import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/bloc/agenda/agenda_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_event.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_bloc.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_event.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_state.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/widgets/teeth/dental_arch_painter.dart';
import 'package:frontend/widgets/teeth/teeth_paths.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';

class NewAppointmentModal extends StatefulWidget {
  const NewAppointmentModal({super.key});

  @override
  State<NewAppointmentModal> createState() => _NewAppointmentModalState();
}

class _NewAppointmentModalState extends State<NewAppointmentModal> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  late PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: AppColors.primary,
      end: AppColors.primary,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    final double minHeight = MediaQuery.of(context).size.height - 350;
    final double maxHeight = MediaQuery.of(context).size.height - 380;
    DateFormat dateFormat = DateFormat.yMMMMd(context.locale.languageCode);
    return BlocListener<NewAppointmentBloc, NewAppointmentState>(
      listener: (context, state) {
        if (state.pageController == PageControllerValue.next) {
          pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
        } else if (state.pageController == PageControllerValue.previous) {
          pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
        if(state.success) {
          context.read<SideBarBloc>().add(ToggleNewAppointmentModal());
          context.read<AgendaBloc>().add(LoadEventsByDate(DateTime.now()));
          toastification.show(
            title: Text("Sucesso"),
            description: Text("Consulta agendada com sucesso"),
            type: ToastificationType.success,
            style: ToastificationStyle.minimal,
          );
        }
      },
      child: BlocBuilder<NewAppointmentBloc, NewAppointmentState>(
        builder: (context, state) {
          return Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                IconButton(
                    onPressed: () => context.read<SideBarBloc>().add(ToggleNewAppointmentModal()),
                    icon: Icon(
                      Icons.close,
                      color: AppColors.grayBlack,
                    )),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: t.newAppointment,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: "\nPasso ${state.page + 1} de ${state.maxPage}",
                            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.withBrightness(0.4)),
                          )
                        ]),
                  ),
                ).expanded()
              ]).paddingOnly(top: 16),
              LinearProgressIndicator(
                value: state.progress,
                // color: AppColors.secondary,
                valueColor: _animation,
              ),
              state.isLoadingAppointmentTypes ||
                      state.isLoadingProcedureTypes ||
                      state.isLoadingDoctors ||
                      state.isRegistering ||
                      state.isLoadingPatients ||
                      state.isLoadingNurses ||
                      state.isLoadingFreeTime
                  ? Center(
                      child: CircularProgressIndicator(),
                    ).expanded()
                  : PageView.builder(
                      controller: pageController,
                      allowImplicitScrolling: false,
                      itemCount: 8,
                      itemBuilder: (context, index) => [
                        /// Patient selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione um paciente",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                                onChanged: (value) => context.read<NewAppointmentBloc>().add(FilterPatients(searchTerm: value)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.filter,
                                      color: AppColors.grayBlack,
                                    ))).paddingSymmetric(horizontal: 4),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              child: SizedBox(
                                width: context.width,
                                height: state.filteredPatients.length * 60 > minHeight ? maxHeight : state.filteredPatients.length * 60,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.filteredPatients.length,
                                  itemBuilder: (context, index) {
                                    UserModel patient = state.filteredPatients[index];
                                    return ListTile(
                                        title: Text(
                                          patient.fullName,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        trailing:
                                            state.model.patient!.uuid == patient.uuid ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                                        onTap: () => context.read<NewAppointmentBloc>().add(UpdatePatient(model: patient)));
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(
                                      color: AppColors.gray2,
                                      indent: 16,
                                      endIndent: 16,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).paddingAll(16),

                        /// Appointment type selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione um tipo de consulta",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                                onChanged: (value) => context.read<NewAppointmentBloc>().add(FilterAppointmentTypes(searchTerm: value)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.filter,
                                      color: AppColors.grayBlack,
                                    ))).paddingSymmetric(horizontal: 4),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              child: SizedBox(
                                width: context.width,
                                height:
                                    state.filteredAppointmentTypes.length * 60 > minHeight ? maxHeight : state.filteredAppointmentTypes.length * 60,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.filteredAppointmentTypes.length,
                                  itemBuilder: (context, index) {
                                    AppointmentTypeModel appointmentType = state.filteredAppointmentTypes[index];
                                    return ListTile(
                                        title: Text(
                                          appointmentType.name.name,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        trailing: state.model.appointmentType!.uuid == appointmentType.uuid
                                            ? FaIcon(Icons.check_circle, color: AppColors.primary)
                                            : null,
                                        onTap: () =>
                                            context.read<NewAppointmentBloc>().add(UpdateAppointmentType(appointmentTypeModel: appointmentType)));
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(
                                      color: AppColors.gray2,
                                      indent: 16,
                                      endIndent: 16,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).paddingAll(16),

                        /// Procedure type selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione um ou mais procedimentos a serem realizados",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                                onChanged: (value) => context.read<NewAppointmentBloc>().add(FilterProcedureTypes(searchTerm: value)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.filter,
                                      color: AppColors.grayBlack,
                                    ))).paddingSymmetric(horizontal: 4),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              child: SizedBox(
                                width: context.width,
                                height: state.filteredProcedureTypes.length * 50 > minHeight ? maxHeight : state.filteredProcedureTypes.length * 50,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.filteredProcedureTypes.length,
                                  itemBuilder: (context, index) {
                                    ProcedureTypeModel procedureType = state.filteredProcedureTypes[index];
                                    return ListTile(
                                        title: Text(
                                          procedureType.name.name,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        trailing: state.model.procedureTypes!.contains(procedureType)
                                            ? FaIcon(Icons.check_circle, color: AppColors.primary)
                                            : null,
                                        onTap: () {
                                          if (state.model.procedureTypes!.contains(procedureType)) {
                                            context.read<NewAppointmentBloc>().add(RemoveProcedureType(procedureTypeModel: procedureType));
                                          } else {
                                            context.read<NewAppointmentBloc>().add(AddProcedureType(procedureTypeModel: procedureType));
                                          }
                                        });
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(
                                      color: AppColors.gray2,
                                      indent: 16,
                                      endIndent: 16,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).paddingAll(16),

                        /// Dentist selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione um dentista",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              child: SizedBox(
                                width: context.width,
                                height: state.doctors.length * 50 > minHeight ? maxHeight : state.doctors.length * 50,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.doctors.length,
                                  itemBuilder: (context, index) {
                                    UserModel doctor = state.doctors[index];
                                    return ListTile(
                                        title: Text(
                                          doctor.fullName,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        trailing: state.model.doctor == doctor ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                                        onTap: () => context.read<NewAppointmentBloc>().add(UpdateDoctor(doctorModel: doctor)));
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(
                                      color: AppColors.gray2,
                                      indent: 16,
                                      endIndent: 16,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).paddingAll(16),

                        /// Nurse selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione uma enfermeira (opcional)",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              child: SizedBox(
                                width: context.width,
                                height: state.nurses.length * 50 > minHeight ? maxHeight : state.nurses.length * 50,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.nurses.length,
                                  itemBuilder: (context, index) {
                                    UserModel nurse = state.nurses[index];
                                    return ListTile(
                                        title: Text(
                                          nurse.fullName,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        trailing: state.model.nurse == nurse ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                                        onTap: () => context.read<NewAppointmentBloc>().add(UpdateNurse(nurseModel: nurse)));
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(
                                      color: AppColors.gray2,
                                      indent: 16,
                                      endIndent: 16,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).paddingAll(16),

                        /// Date e hour selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione uma data e um horário",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                                controller: TextEditingController(text: dateFormat.format(state.model.date)),
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                    suffixIcon: IconButton(
                                        onPressed: () async {
                                          DateTime? date = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(2025, 1, 1),
                                            lastDate: DateTime(2100, 12, 31),
                                            locale: context.locale,
                                            currentDate: state.model.date,
                                            initialDate: state.model.date,
                                            initialDatePickerMode: DatePickerMode.day,
                                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                                          );
                                          if (date != null) {
                                            if (mounted) {
                                              context.read<NewAppointmentBloc>().add(UpdateDate(date));
                                            }
                                          }
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.calendar,
                                          color: AppColors.grayBlack,
                                        )))).paddingSymmetric(horizontal: 4),
                            Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                color: Colors.white,
                                child: SingleChildScrollView(
                                    child: Wrap(
                                  children: state.timeRanges.map(
                                    (e) {
                                      return ChoiceChip(
                                          label: Text(e.toString()),
                                          selected: state.model.startTime == e.startTime && state.model.endTime == e.endTime,
                                          onSelected: (value) {
                                            context.read<NewAppointmentBloc>().add(UpdateTimeRange(e));
                                          }).paddingAll(4);
                                    },
                                  ).toList(),
                                )).paddingAll(16)),
                          ],
                        ).paddingAll(16),

                        /// Teeth selection
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selecione os dentes a serem tratatos (opcional)",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Wrap(
                              children: state.model.teeth!.map(
                                (e) {
                                  return Chip(
                                    label: Text(e.name.replaceAll('T_', '')),
                                    onDeleted: () => context.read<NewAppointmentBloc>().add(RemoveTooth(e)),
                                  ).paddingAll(4);
                                },
                              ).toList(),
                            ),
                            GestureDetector(
                              onTapUp: (details) {
                                final touchPosition = details.localPosition;
                                for (var entry in TeethPaths.teethPaths.entries) {
                                  final paths = entry.value;
                                  if (paths.any((path) => path.contains(touchPosition))) {
                                    setState(() {
                                      if (state.model.teeth!.contains(entry.key)) {
                                        context.read<NewAppointmentBloc>().add(RemoveTooth(entry.key));
                                      } else {
                                        context.read<NewAppointmentBloc>().add(AddTooth(entry.key));
                                      }
                                    });
                                    break;
                                  }
                                }
                              },
                              child: CustomPaint(
                                painter: DentalArchPainter(
                                  selectedTeeth: state.model.teeth!,
                                  toothPaths: TeethPaths.teethPaths,
                                ),
                                size: Size.infinite,
                              ),
                            ).paddingSymmetric(horizontal: 128).expanded(),
                          ],
                        ).paddingAll(16),

                        /// Notes
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Notas",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) => context.read<NewAppointmentBloc>().add(UpdateNotes(value)),
                              maxLines: 10,
                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                            ).paddingSymmetric(horizontal: 4),
                          ],
                        ).paddingAll(16),
                      ][index],
                    ).expanded(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  state.page > 0
                      ? IconButton(
                          onPressed: () => context.read<NewAppointmentBloc>().add(PreviousPage()),
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: AppColors.grayBlack,
                          ))
                      : SizedBox().expanded(),
                  state.page == state.maxPage - 1
                      ? FilledButton(
                          onPressed: () => context.read<NewAppointmentBloc>().add(SubmitNewAppointment()),
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            backgroundColor: AppColors.primary,
                          ),
                          child: Text(
                            "Finalizar",
                            style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                          ))
                      : IconButton(
                          onPressed: () => context.read<NewAppointmentBloc>().add(NextPage()),
                          icon: FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: AppColors.grayBlack,
                          )),
                ],
              ).paddingLTRB(16, 4, 16, 16)
            ],
          );
        },
      ),
    );
  }

/*List<Widget> getPages({required BuildContext context, required NewAppointmentBloc state}) {
    final double minHeight = MediaQuery.of(context).size.height - 350;
    final double maxHeight = MediaQuery.of(context).size.height - 360;
    DateFormat dateFormat = DateFormat.yMMMMd(context.locale.languageCode);
    return [
      /// Patient selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione um paciente",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
              onChanged: (value) => context.read<NewAppointmentBloc>().add(FilterPatients(searchTerm: value)),
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  suffixIcon: Icon(
                    FontAwesomeIcons.filter,
                    color: AppColors.grayBlack,
                  ))).paddingSymmetric(horizontal: 4),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white,
            child: SizedBox(
              width: context.width,
              height: state.filteredPatients.length * 60 > minHeight ? maxHeight : provider.filteredPatients.length * 60,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.filteredPatients.length,
                itemBuilder: (context, index) {
                  UserModel patient = provider.filteredPatients[index];
                  return ListTile(
                      title: Text(
                        patient.fullName,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: provider.model.patient!.uuid == patient.uuid ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                      onTap: () => provider.updatePatient(patient));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.gray2,
                    indent: 16,
                    endIndent: 16,
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(16),

      /// Appointment type selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione um tipo de consulta",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
              onChanged: (value) => provider.filterAppointmentTypes(value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  suffixIcon: Icon(
                    FontAwesomeIcons.filter,
                    color: AppColors.grayBlack,
                  ))).paddingSymmetric(horizontal: 4),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white,
            child: SizedBox(
              width: context.width,
              height: provider.filteredAppointmentTypes.length * 60 > minHeight ? maxHeight : provider.filteredAppointmentTypes.length * 60,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.filteredAppointmentTypes.length,
                itemBuilder: (context, index) {
                  AppointmentTypeModel appointmentType = provider.filteredAppointmentTypes[index];
                  return ListTile(
                      title: Text(
                        appointmentType.name.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing:
                          provider.model.appointmentType!.uuid == appointmentType.uuid ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                      onTap: () => provider.updateAppointmentType(appointmentType));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.gray2,
                    indent: 16,
                    endIndent: 16,
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(16),

      /// Procedure type selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione um ou mais procedimentos a serem realizados",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
              onChanged: (value) => provider.filterProcedureTypes(value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  suffixIcon: Icon(
                    FontAwesomeIcons.filter,
                    color: AppColors.grayBlack,
                  ))).paddingSymmetric(horizontal: 4),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white,
            child: SizedBox(
              width: context.width,
              height: provider.filteredProcedureTypes.length * 50 > minHeight ? maxHeight : provider.filteredProcedureTypes.length * 50,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.filteredProcedureTypes.length,
                itemBuilder: (context, index) {
                  ProcedureTypeModel procedureType = provider.filteredProcedureTypes[index];
                  return ListTile(
                      title: Text(
                        procedureType.name.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: provider.model.procedureTypes!.contains(procedureType) ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                      onTap: () {
                        if (provider.model.procedureTypes!.contains(procedureType)) {
                          provider.removeProcedureType(procedureType);
                        } else {
                          provider.addProcedureType(procedureType);
                        }
                      });
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.gray2,
                    indent: 16,
                    endIndent: 16,
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(16),

      /// Dentist selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione um dentista",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white,
            child: SizedBox(
              width: context.width,
              height: provider.doctors.length * 50 > minHeight ? maxHeight : provider.doctors.length * 50,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.doctors.length,
                itemBuilder: (context, index) {
                  UserModel doctor = provider.doctors[index];
                  return ListTile(
                      title: Text(
                        doctor.fullName,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: provider.model.doctor == doctor ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                      onTap: () => provider.updateDoctor(doctor));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.gray2,
                    indent: 16,
                    endIndent: 16,
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(16),

      /// Nurse selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione uma enfermeira (opcional)",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white,
            child: SizedBox(
              width: context.width,
              height: provider.nurses.length * 50 > minHeight ? maxHeight : provider.nurses.length * 50,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.nurses.length,
                itemBuilder: (context, index) {
                  UserModel nurse = provider.nurses[index];
                  return ListTile(
                      title: Text(
                        nurse.fullName,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: provider.model.nurse == nurse ? FaIcon(Icons.check_circle, color: AppColors.primary) : null,
                      onTap: () => provider.updateNurse(nurse));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.gray2,
                    indent: 16,
                    endIndent: 16,
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(16),

      /// Date e hour selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione uma data e um horário",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
              controller: TextEditingController(text: dateFormat.format(provider.model.date)),
              onChanged: (value) => provider.filterPatients(value),
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2025, 1, 1),
                          lastDate: DateTime(2100, 12, 31),
                          locale: context.locale,
                          currentDate: provider.model.date,
                          initialDate: provider.model.date,
                          initialDatePickerMode: DatePickerMode.day,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (date != null) {
                          provider.updateDate(date);
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.calendar,
                        color: AppColors.grayBlack,
                      )))).paddingSymmetric(horizontal: 4),
          Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Wrap(
                children: provider.timeRanges.map(
                  (e) {
                    return ChoiceChip(
                        label: Text(e.toString()),
                        selected: provider.model.startTime == e.startTime && provider.model.endTime == e.endTime,
                        onSelected: (value) {
                          provider.selectTimeRange(e);
                        }).paddingAll(4);
                  },
                ).toList(),
              )).paddingAll(16)),
        ],
      ).paddingAll(16),

      /// Teeth selection
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione os dentes a serem tratatos (opcional)",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Wrap(
            children: provider.model.teeth!.map(
              (e) {
                return Chip(
                  label: Text(e.name.replaceAll('T_', '')),
                  onDeleted: () => provider.removeTooth(e),
                ).paddingAll(4);
              },
            ).toList(),
          ),
          GestureDetector(
            onTapUp: (details) {
              final touchPosition = details.localPosition;
              for (var entry in TeethPaths.teethPaths.entries) {
                final paths = entry.value;
                if (paths.any((path) => path.contains(touchPosition))) {
                  setState(() {
                    if (provider.model.teeth!.contains(entry.key)) {
                      provider.removeTooth(entry.key);
                    } else {
                      provider.addTooth(entry.key);
                    }
                  });
                  break;
                }
              }
            },
            child: CustomPaint(
              painter: DentalArchPainter(
                selectedTeeth: provider.model.teeth!,
                toothPaths: TeethPaths.teethPaths,
              ),
              size: Size.infinite,
            ),
          ).paddingSymmetric(horizontal: 128).expanded(),
        ],
      ).paddingAll(16),

      /// Notes
      Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notas",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            controller: provider.tecNotes,
            maxLines: 10,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ).paddingSymmetric(horizontal: 4),
        ],
      ).paddingAll(16),
    ];
  }*/
}
