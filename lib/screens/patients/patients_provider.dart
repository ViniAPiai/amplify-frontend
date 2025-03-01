part of 'patients_screen.dart';

class PatientsProvider extends ChangeNotifier {

  TextEditingController tecSearch = TextEditingController(text: "");
  late PagePatientResponseModel patients;
  late bool isLoading = true;
  late int selectedPage = 1;

  PatientsProvider() {
    loadPatients();
  }

  void changePage(int page){
    selectedPage = page;
    notifyListeners();
    loadPatients();
  }

  void search() {
    selectedPage = 1;
    notifyListeners();
    loadPatients();
  }

  void loadPatients() async {
    patients = await PatientService().pagination(searchTerm: tecSearch.text, page: selectedPage - 1);
    isLoading = false;
    notifyListeners();
  }

  bool hasContent() {
    /*if(isLoading) {
      return false;
    }*/
    if (patients.content.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }


}
