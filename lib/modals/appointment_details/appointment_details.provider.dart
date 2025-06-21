import 'package:flutter/cupertino.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class AppointmentDetailsProvider extends ChangeNotifier {
  AppointmentModel appointment = AppointmentModel.empty();
  int selectedTab = 0;

  AppointmentDetailsProvider(this.appointment);

  void changeSelectedTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void setClinicalExam({required BuildContext context}) async {
    (await ApiService.create(withAuth: true)).client.insertOrUpdateClinicalExam(appointment.clinicalExam!, appointment.uuid!).then(
      (value) {
        appointment.clinicalExam = value;
        notifyListeners();
        context.read<SideBarProvider>().openOrCloseClinicalExamModal();
        toastification.show(
            style: ToastificationStyle.minimal, type: ToastificationType.success, title: Text("Sucesso!"), description: Text(value.message!));
      },
    );
  }

  void patientArrived() async {
    (await ApiService.create()).client.patientArrivedAppointmentByClinic(appointment.uuid!).then(
          (value) {
            appointment = value;
            notifyListeners();
            toastification.show(
                style: ToastificationStyle.minimal, type: ToastificationType.success, title: Text("Sucesso!"), description: Text(value.message!));
          },
        );
  }

  void updateHasCavities(bool value) {
    appointment.clinicalExam?.hasCavities = value;
    notifyListeners();
  }

  void updateHasToothWear(bool value) {
    appointment.clinicalExam?.hasToothWear = value;
    notifyListeners();
  }

  void updateHasFractures(bool value) {
    appointment.clinicalExam?.hasFractures = value;
    notifyListeners();
  }

  void updateHasGumBleeding(bool value) {
    appointment.clinicalExam?.hasGumBleeding = value;
    notifyListeners();
  }

  void updateHasGumInflammation(bool value) {
    appointment.clinicalExam?.hasGumInflammation = value;
    notifyListeners();
  }

  void updateHasGumRecession(bool value) {
    appointment.clinicalExam?.hasGumRecession = value;
    notifyListeners();
  }

  void updateOtherObservations(String value) {
    appointment.clinicalExam?.otherObservations = value;
    notifyListeners();
  }
}
