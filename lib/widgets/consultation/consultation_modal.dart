import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/message_extension.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/models/consultation/consultation_model.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/widgets/dialogs/amplify_dialog.dart';

import 'package:frontend/widgets/form/consultation_register/date_picker_button.dart';
import 'package:frontend/widgets/form/consultation_register/patient_selection_form_field.dart';
import 'package:frontend/widgets/form/consultation_register/time_picker_button.dart';
import 'package:frontend/widgets/form/consultation_register/user_selection_form_field.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConsultationModal extends StatelessWidget {
  const ConsultationModal({super.key});

  @override
  Widget build(BuildContext context) {
    AgendaProvider agendaProvider = Provider.of<AgendaProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return AnimatedPositioned(
        right: 0,
        left: context.isDesktop ? null : 0,
        duration: Duration(milliseconds: 500),
        child: Container(
          width: context.isDesktop ? 600 : context.width,
          height: context.height,
          color: AppColors.gray,
          padding: EdgeInsets.all(16),
          child: Form(
            key: agendaProvider.consultationKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      IconButton(
                          onPressed: () => agendaProvider.openAddConsultation(), icon: Icon(Icons.close, size: 24, color: AppColors.secondary)),
                      Text(
                        agendaProvider.isEditing ? agendaProvider.patient!.fullName : t.newConsultation,
                        style: GoogleFonts.inter(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w700),
                      ).expanded(),
                      agendaProvider.isEditing
                          ? IconButton(
                              onPressed: () {
                                // TODO delete consultation
                              },
                              icon: Icon(FontAwesomeIcons.trash, size: 24, color: Colors.red))
                          : const SizedBox()
                    ],
                  ),
                  PatientSelectionFormField(
                      enabled: !agendaProvider.isFinished, onChanged: (value) => agendaProvider.updatePatient(value), model: agendaProvider.patient),
                  Row(
                    spacing: 16,
                    children: [
                      DatePickerButton(
                        enabled: agendaProvider.isFinished,
                      ).expanded(),
                      TimePickerButton(
                        enabled: agendaProvider.isFinished,
                        label: t.beginTimeLabel,
                        time: agendaProvider.consultationStartTime,
                        onChanged: (value) => agendaProvider.updateConsultationStartTime(value),
                      ).expanded(),
                      TimePickerButton(
                        enabled: agendaProvider.isFinished,
                        label: t.endTimeLabel,
                        time: agendaProvider.consultationEndTime,
                        onChanged: (value) => agendaProvider.updateConsultationEndTime(value),
                      ).expanded()
                    ],
                  ),
                  UserSelectionFormField(
                    enabled: true,
                    onChanged: (value) => agendaProvider.updateDoctor(value),
                    label: t.doctorLabel,
                    items: agendaProvider.doctors,
                    model: agendaProvider.doctor,
                  ),
                  Label(label: t.descriptionLabel),
                  TextFormField(
                    controller: agendaProvider.tecConsultationDescription,
                    maxLines: 10,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                  ),
                  agendaProvider.isFinished
                      ? const SizedBox()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (agendaProvider.consultationKey.currentState!.validate()) {
                                  if (agendaProvider.isEditing) {
                                    agendaProvider.updateConsultation(context);
                                  } else {
                                    try {
                                      ConsultationModel model = await agendaProvider.addConsultation(context);
                                      AmplifyDialog.success(context, message: context.getMessage(model.message!));
                                    } catch (e) {
                                      AmplifyDialog.error(context, message: context.getMessage(e.toString()));
                                    }
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                              child: Text(
                                agendaProvider.isEditing ? t.edit : t.register,
                                style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                        )
                ],
              ),
            ),
          ),
        ));
  }
}
