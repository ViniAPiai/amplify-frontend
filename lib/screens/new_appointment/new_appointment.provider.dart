part of 'new_appointment.dart';

class NewAppointmentProvider extends ChangeNotifier {

  bool isFinished = false;
  late UserModel patient = UserModel(fullName: "");

  void updatePatient(UserModel model) {
    patient = model;
    notifyListeners();
  }

}