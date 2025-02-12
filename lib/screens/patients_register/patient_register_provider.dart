part of 'patient_register_screen.dart';

class PatientRegisterProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPassword = false;
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecFullName = TextEditingController();
  TextEditingController tecDocumentNumber = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecConfirmPassword = TextEditingController();
  TextEditingController tecStreet = TextEditingController();
  TextEditingController tecNumber = TextEditingController();
  TextEditingController tecComplement = TextEditingController();
  TextEditingController tecDistrict = TextEditingController();
  TextEditingController tecZipCode = TextEditingController();
  String? tecCity;
  String? tecState;
  String tecCountry = "";
  String? tecGender;
  TextEditingController tecBirthDate = TextEditingController();
  TextEditingController tecPhoneNumber = TextEditingController();
  TextEditingController tecHealthNumber = TextEditingController();
  TextEditingController tecNationalRegistry = TextEditingController();
  TextEditingController tecNationalRegistryExpirationDate = TextEditingController();
  TextEditingController tecOccupation = TextEditingController();

  Map<String, dynamic> _states = {};
  bool isLoadingStates = true;

  List<String> get states => _states.keys.toList();
  List<String> get cities => tecState != null ? _states[tecState!]! : [];

  PatientRegisterProvider() {
    loadStates();
    isLoadingStates = false;
    notifyListeners();
  }

  void loadStates() async {
    String resp = "";
    if(tecCountry == 'Portugal') {
      resp = await rootBundle.loadString('assets/countries_states_and_cities/portugal.json');
    } else if(tecCountry == 'Brasil') {
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
    loadStates();
    notifyListeners();
  }

  void updateGender(String gender) {
    tecGender = gender;
    notifyListeners();
  }

  PatternValidator getPostalCodeValidator() {
    if (tecCountry == 'Portugal') {
      return PatternValidator(RegExp(r'^\d{4}-\d{3}$'), errorText: "Um Código Postal válido deve ser informado");
    } else if(tecCountry == 'Brasil') {
      return PatternValidator(RegExp(r'^\d{5}-?\d{3}$'), errorText: "Um Código Postal válido deve ser informado");
    }
    return PatternValidator(RegExp(r'^\d{4}-\d{3}$'), errorText: "Um Código Postal válido deve ser informado");
  }

  MaskTextInputFormatter getPostalCodeFormatter() {
    if(tecCountry == 'Portugal') {
      return MaskTextInputFormatter(mask: '#####-###', filter: { "#": RegExp(r'[0-9]') },);
    }else if(tecCountry == 'Brasil') {
      return MaskTextInputFormatter(mask: '#####-###', filter: { "#": RegExp(r'[0-9]') },);
    }
    return MaskTextInputFormatter(mask: '#####-###', filter: { "#": RegExp(r'[0-9]') },);
  }

  String getPostalCodeHint() {
    if(tecCountry == 'Portugal') {
      return "1234-567";
    }else if(tecCountry == 'Brasil') {
      return "12345-678";
    }
    return "1234-567";
  }

  PatternValidator phoneValidator() {
    final regexBrazil = PatternValidator(RegExp(r'^\(?[1-9]{2}\)? ?9[0-9]{4}-?[0-9]{4}$'), errorText: "Um número de celular válido deve ser informado");
    final regexPortugal = PatternValidator(RegExp(r'^9\d{2} ?\d{3} ?\d{3}$'), errorText: "Um número de celular válido deve ser informado");
    if (tecCountry == "Brasil") {
      return regexBrazil;
    } else if (tecCountry == "Portugal") {
      return regexPortugal;
    }
    return regexPortugal;
  }

  MaskTextInputFormatter phoneFormatter() {
    if(tecCountry == 'Portugal') {
      return MaskTextInputFormatter(mask: '9## ### ###', filter: { "#": RegExp(r'[0-9]') },);
    }else if(tecCountry == 'Brasil') {
      return MaskTextInputFormatter(mask: '(##) 9####-####', filter: { "#": RegExp(r'[0-9]') },);
    }
    return MaskTextInputFormatter(mask: '9## ### ###', filter: { "#": RegExp(r'[0-9]') },);
  }

  RegExp documentNumberValidator() {
    RegExp brazil = RegExp(r'^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$');
    RegExp portugal = RegExp(r'^\d{9}$');
    if(tecCountry == 'Portugal') {
      return portugal;
    } else if(tecCountry == 'Brasil') {
      return brazil;
    }
    return portugal;
  }

  MaskTextInputFormatter documentNumberFormatter() {
    if(tecCountry == 'Brasil') {
      return MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]')},);
    } else if(tecCountry == 'Portugal') {
      return MaskTextInputFormatter(mask: '#########', filter: { "#": RegExp(r'[0-9]')},);
    }
    return MaskTextInputFormatter(mask: '#########', filter: { "#": RegExp(r'[0-9]')},);
  }

  RegExp healthNumberValidator() {
    final RegExp brazil = RegExp(r'^\d{15}$');
    final RegExp portugal = RegExp(r'^\d{9}$');
    if(tecCountry == 'Portugal') {
      return portugal;
    } else if(tecCountry == 'Brasil') {
      return brazil;
    }
    return portugal;
  }

  MaskTextInputFormatter healthNumberFormatter() {
    MaskTextInputFormatter brazil = MaskTextInputFormatter(mask: '################', filter: { "#": RegExp(r'[0-9]')},);
    MaskTextInputFormatter portugal = MaskTextInputFormatter(mask: '#########', filter: { "#": RegExp(r'[0-9]')},);
    if(tecCountry == 'Brasil') {
      return brazil;
    }else if(tecCountry == 'Portugal') {
      return portugal;
    }
    return portugal;
  }

}