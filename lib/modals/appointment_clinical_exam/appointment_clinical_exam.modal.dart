import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_bloc.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_event.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_state.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/widgets/buttons/button_selection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class AppointmentClinicalExamModal extends StatelessWidget {
  const AppointmentClinicalExamModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentDetailsBloc, AppointmentDetailsState>(
      listener: (context, state) {
        if (state.successSubmittingClinicalExam) {
          context.read<SideBarBloc>().add(ToggleClinicalExamModal());
          toastification.show(
            title: Text("Sucesso", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)),
            type: ToastificationType.success,
            style: ToastificationStyle.minimal
          );
        }
      },
      child: BlocBuilder<AppointmentDetailsBloc, AppointmentDetailsState>(builder: (context, state) {
        AppointmentModel appointment = context.read<AppointmentDetailsBloc>().state.appointment;
        return ListView.separated(
                itemBuilder: (context, index) => [
                      Row(
                        children: [
                          Text(
                            "Exame Clínico",
                            style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          IconButton(onPressed: () => context.read<SideBarBloc>().add(ToggleClinicalExamModal()), icon: Icon(Icons.close))
                        ],
                      ),
                      Divider(),
                      Text(
                        "Tem cáries?",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasCavitiesEvent(true)),
                              text: "Sim",
                              condition: appointment.clinicalExam!.hasCavities),
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasCavitiesEvent(false)),
                              text: "Não",
                              condition: !appointment.clinicalExam!.hasCavities),
                        ],
                      ),
                      Text(
                        "Tem desgaste dentário?",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasToothWearEvent(true)),
                              text: "Sim",
                              condition: appointment.clinicalExam!.hasToothWear),
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasToothWearEvent(false)),
                              text: "Não",
                              condition: !appointment.clinicalExam!.hasToothWear),
                        ],
                      ),
                      Text(
                        "Tem fraturas?",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasFracturesEvent(true)),
                              text: "Sim",
                              condition: appointment.clinicalExam!.hasFractures),
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasFracturesEvent(false)),
                              text: "Não",
                              condition: !appointment.clinicalExam!.hasFractures),
                        ],
                      ),
                      Text(
                        "Tem sangramento gengival?",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasGumBleedingEvent(true)),
                              text: "Sim",
                              condition: appointment.clinicalExam!.hasGumBleeding),
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasGumBleedingEvent(false)),
                              text: "Não",
                              condition: !appointment.clinicalExam!.hasGumBleeding),
                        ],
                      ),
                      Text(
                        "Tem inflamação gengival?",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasGumInflammationEvent(true)),
                              text: "Sim",
                              condition: appointment.clinicalExam!.hasGumInflammation),
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasGumInflammationEvent(false)),
                              text: "Não",
                              condition: !appointment.clinicalExam!.hasGumInflammation),
                        ],
                      ),
                      Text(
                        "Tem retração gengival?",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasGumRecessionEvent(true)),
                              text: "Sim",
                              condition: appointment.clinicalExam!.hasGumRecession),
                          ButtonSelection(
                              onPressed: () => context.read<AppointmentDetailsBloc>().add(UpdateHasGumRecessionEvent(false)),
                              text: "Não",
                              condition: !appointment.clinicalExam!.hasGumRecession),
                        ],
                      ),
                      Text(
                        "Observações",
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                          controller: TextEditingController(text: appointment.clinicalExam!.otherObservations),
                          onChanged: (value) => context.read<AppointmentDetailsBloc>().add(UpdateOtherObservationsEvent(value)),
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: AppColors.gray, width: 1),
                          ))),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => context.read<AppointmentDetailsBloc>().add(SubmitClinicalExamEvent()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            fixedSize: Size(context.width, 50)),
                        child: Text(appointment.clinicalExam!.uuid.isEmpty ? "Adicionar" : "Atualizar",
                            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                      )
                    ][index],
                separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                itemCount: 18)
            .paddingAll(context.isTabletOrDesktop ? 32 : 16);
      }),
    );
  }
}
