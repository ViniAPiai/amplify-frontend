part of 'patients_screen.dart';

class PatientsProvider extends ChangeNotifier {

  TextEditingController tecSearch = TextEditingController();
  int selectedPage = 0;

  void changePage(int page){
    selectedPage = page;
    notifyListeners();
  }

}
