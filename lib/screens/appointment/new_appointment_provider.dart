part of 'new_appointment_screen.dart';

class NewAppointmentProvider extends ChangeNotifier {

  bool isFinished = false;
  late UserModel patient = UserModel(fullName: "");

  void updatePatient(UserModel model) {
    patient = model;
    notifyListeners();
  }

}