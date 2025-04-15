part of 'patient_detail.dart';

class PatientDetailProvider extends ChangeNotifier {

  int selectedIndex = 0;

  void toggle(int index) {
    selectedIndex = index;
    notifyListeners();
  }

}