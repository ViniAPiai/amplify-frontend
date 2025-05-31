part of 'new_patient.dart';

class NewPatientProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPassword = false;
  String? tecCity;
  String? tecState;
  String tecCountry = "";
  String? tecGender;
  TextEditingController tecEmail = TextEditingController(text: "vini@gmail.com");
  TextEditingController tecFullName = TextEditingController(text: "Vinicius");
  TextEditingController tecDocumentNumber = TextEditingController(text: "123456789");
  TextEditingController tecPassword = TextEditingController(text: "T&stantdo1");
  TextEditingController tecConfirmPassword = TextEditingController(text: "T&stantdo1");
  TextEditingController tecStreet = TextEditingController(text: "Alvorada");
  TextEditingController tecNumber = TextEditingController(text: "345");
  TextEditingController tecComplement = TextEditingController(text: "Casa");
  TextEditingController tecDistrict = TextEditingController(text: "Forquilhas");
  TextEditingController tecZipCode = TextEditingController(text: "8810-546");
  TextEditingController tecBirthDate = TextEditingController(text: "08/07/1999");
  TextEditingController tecPhoneNumber = TextEditingController(text: "934 912 012");
  TextEditingController tecHealthNumber = TextEditingController(text: "12312312312");
  TextEditingController tecNationalRegistry = TextEditingController(text: "2131231231231");
  TextEditingController tecNationalRegistryExpirationDate = TextEditingController(text: "01/05/2030");
  TextEditingController tecOccupation = TextEditingController(text: "Programmer");

  Map<String, dynamic> _states = {};
  bool isLoading = true;

  List<String> get states => _states.keys.toList();

  List<String> get cities => tecState != null ? _states[tecState!]! : [];

  NewPatientProvider() {
    init();
  }

  void init() async {
    (await ApiService.create()).client.getCountry()
    .then((value) {
      tecCountry = value.country;
      loadStates();
      isLoading = false;
      notifyListeners();
    },);
  }

  void loadStates() async {
    String resp = "";
    if (tecCountry == 'Portugal') {
      resp = await rootBundle.loadString('assets/countries_states_and_cities/portugal.json');
    } else if (tecCountry == 'Brasil') {
      resp = await rootBundle.loadString('assets/countries_states_and_cities/brazil.json');
    } else {
      resp = await rootBundle.loadString('assets/countries_states_and_cities/portugal.json');
    }
    final Map<String, dynamic> data = json.decode(resp);
    Map<String, List<String>> parsedData = data.map((key, value) {
      if (value is List) {
        return MapEntry(key, ["", ...value.cast<String>()]);
      } else {
        throw Exception("Formato inválido no JSON");
      }
    });
    parsedData[""] = ["", "Selecione um estado"];
    _states = parsedData;
    notifyListeners();
  }

  void updateShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void updateState(String? state) {
    tecState = state;
    tecCity = null;
    notifyListeners();
  }

  void updateCity(String? city) {
    tecCity = city;
    notifyListeners();
  }

  void updateCountry(String country) {
    tecCountry = country;
    tecState = "";
    tecCity = "";
    loadStates();
    notifyListeners();
  }

  void updateGender(String gender) {
    tecGender = gender;
    notifyListeners();
  }

  void validateForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      DateFormat format = DateFormat("dd/MM/yyyy");
      PatientModel patientModel = PatientModel(
          gender: tecGender!,
          birthDate: format.parse(tecBirthDate.text),
          phoneNumber: tecPhoneNumber.text,
          healthNumber: tecHealthNumber.text,
          nationalRegistry: tecNationalRegistry.text,
          nationalRegistryExpirationDate: format.parse(tecNationalRegistryExpirationDate.text),
          occupation: tecOccupation.text,
          uuid: "",
          fullName: tecFullName.text,
          email: tecEmail.text,
          documentNumber: tecDocumentNumber.text,
          address: AddressModel(
              uuid: "",
              street: tecStreet.text,
              number: tecNumber.text,
              neighborhood: tecDistrict.text,
              city: tecCity!,
              state: tecState!,
              country: tecCountry));
      (await ApiService.create()).client.insertByClinic(patientModel).then(
        (value) {
          PanaraInfoDialog.show(context,
              message: context.getMessage(value),
              buttonText: "OK!",
              onTapDismiss: () => context.pop(),
              panaraDialogType: PanaraDialogType.success);
        },
      );
    }
  }
}
