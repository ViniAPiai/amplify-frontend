import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/modals/appointment_details/appointment_details.provider.dart';
import 'package:frontend/widgets/buttons/button_selection.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppointmentClinicalExamModal extends StatelessWidget {
  const AppointmentClinicalExamModal({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => getItems(context: context)[index],
        separatorBuilder: (context, index) => const SizedBox(height: 16,),
        itemCount: getItems(context: context).length
    ).paddingAll(context.isTabletOrDesktop ? 32 : 16);
  }

  List<Widget> getItems({required BuildContext context}) {
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    return [
      Row(
        children: [
          Text(
            "Exame Clínico",
            style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          IconButton(onPressed: () => sideBarProvider.openOrCloseClinicalExamModal(), icon: Icon(Icons.close))
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
          ButtonSelection(onPressed: () => provider.updateHasCavities(true), text: "Sim", condition: provider.appointment.clinicalExam!.hasCavities),
          ButtonSelection(
              onPressed: () => provider.updateHasCavities(false), text: "Não", condition: !provider.appointment.clinicalExam!.hasCavities),
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
              onPressed: () => provider.updateHasToothWear(true), text: "Sim", condition: provider.appointment.clinicalExam!.hasToothWear),
          ButtonSelection(
              onPressed: () => provider.updateHasToothWear(false), text: "Não", condition: !provider.appointment.clinicalExam!.hasToothWear),
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
              onPressed: () => provider.updateHasFractures(true), text: "Sim", condition: provider.appointment.clinicalExam!.hasFractures),
          ButtonSelection(
              onPressed: () => provider.updateHasFractures(false), text: "Não", condition: !provider.appointment.clinicalExam!.hasFractures),
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
              onPressed: () => provider.updateHasGumBleeding(true), text: "Sim", condition: provider.appointment.clinicalExam!.hasGumBleeding),
          ButtonSelection(
              onPressed: () => provider.updateHasGumBleeding(false), text: "Não", condition: !provider.appointment.clinicalExam!.hasGumBleeding),
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
              onPressed: () => provider.updateHasGumInflammation(true),
              text: "Sim",
              condition: provider.appointment.clinicalExam!.hasGumInflammation),
          ButtonSelection(
              onPressed: () => provider.updateHasGumInflammation(false),
              text: "Não",
              condition: !provider.appointment.clinicalExam!.hasGumInflammation),
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
              onPressed: () => provider.updateHasGumRecession(true), text: "Sim", condition: provider.appointment.clinicalExam!.hasGumRecession),
          ButtonSelection(
              onPressed: () => provider.updateHasGumRecession(false), text: "Não", condition: !provider.appointment.clinicalExam!.hasGumRecession),
        ],
      ),
      Text(
        "Observações",
        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      TextFormField(
        controller: TextEditingController(text: provider.appointment.clinicalExam!.otherObservations),
          onChanged: (value) {
            provider.updateOtherObservations(value);
          },
          maxLines: 5,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.gray, width: 1),
              ))),
      Spacer(),
      ElevatedButton(
        onPressed: () => provider.setClinicalExam(context: context),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            fixedSize: Size(context.width, 50)),
        child: Text(provider.appointment.clinicalExam!.uuid.isEmpty ? "Adicionar" : "Atualizar",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
      )
    ];
  }
}
