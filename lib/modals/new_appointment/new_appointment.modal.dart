import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/enums/tooth_code.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/modals/new_appointment/new_appointment.provider.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/teeth/dental_arch_painter.dart';
import 'package:frontend/widgets/teeth/teeth_paths.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:frontend/l10n/app_localizations.dart';

class NewAppointmentModal extends StatefulWidget {
  const NewAppointmentModal({super.key});

  @override
  State<NewAppointmentModal> createState() => _NewAppointmentModalState();
}

class _NewAppointmentModalState extends State<NewAppointmentModal> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

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
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    NewAppointmentProvider provider = Provider.of<NewAppointmentProvider>(context);
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          IconButton(
              onPressed: () => sideBarProvider.openOrCloseNewAppointmentModal(context: context),
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
                      text: "\nPasso ${provider.page + 1} de ${provider.maxPage}",
                      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.withBrightness(0.4)),
                    )
                  ]),
            ),
          ).expanded()
        ]).paddingOnly(top: 16),
        LinearProgressIndicator(
          value: provider.progress,
          // color: AppColors.secondary,
          valueColor: _animation,
        ),
        provider.isLoadingAppointmentTypes || provider.isLoadingProcedureTypes || provider.isLoadingDoctors || provider.isRegistering
            ? Center(
                child: CircularProgressIndicator(),
              ).expanded()
            : PageView.builder(
                controller: provider.pageController,
                allowImplicitScrolling: false,
                itemCount: getPages(context: context).length,
                itemBuilder: (context, index) => getPages(context: context)[index],
              ).expanded(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            provider.page > 0
                ? IconButton(
                    onPressed: () => provider.previousPage(),
                    icon: FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: AppColors.grayBlack,
                    ))
                : SizedBox().expanded(),
            provider.page == provider.maxPage - 1
                ? FilledButton(
                    onPressed: () => provider.addAppointment(context),
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "Finalizar",
                      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                    ))
                : IconButton(
                    onPressed: () => provider.nextPage(),
                    icon: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: AppColors.grayBlack,
                    )),
          ],
        ).paddingLTRB(16, 4, 16, 16)
      ],
    );
  }

  List<Widget> getPages({required BuildContext context}) {
    NewAppointmentProvider provider = Provider.of<NewAppointmentProvider>(context);
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
              onChanged: (value) => provider.filterPatients(value),
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
              height: provider.filteredPatients.length * 60 > minHeight ? maxHeight : provider.filteredPatients.length * 60,
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
                      trailing: provider.model.appointmentType!.uuid == appointmentType.uuid
                          ? FaIcon(Icons.check_circle, color: AppColors.primary)
                          : null,
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
  }
}
