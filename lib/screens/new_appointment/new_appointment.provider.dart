part of 'new_appointment.dart';

class NewAppointmentProvider extends ChangeNotifier {
  /// Modal attributes
  bool showBarrier = false;
  bool showNewAppointmentModel = false;
  /// Page Controller attributes
  PageController pageController = PageController(initialPage: 0);
  int page = 0;
  int maxPage = 8;
  double progress = 1 / 8;
  late AppointmentModel model = AppointmentModel.empty();
  bool isRegistering = false;
  TextEditingController tecNotes = TextEditingController();
  bool isFinished = false;
  bool isLoadingPatients = true;
  late List<UserModel> patients = [];
  late List<UserModel> filteredPatients = [];
  bool isLoadingDoctors = true;
  late List<UserModel> doctors = [];
  bool isLoadingNurses = true;
  late List<UserModel> nurses = [];
  bool isLoadingProcedureTypes = true;
  late List<ProcedureTypeModel> filteredProcedureTypes = [];
  late List<ProcedureTypeModel> procedureTypes = [];
  late List<TimeRange> timeRanges = [];
  bool isLoadingAppointmentTypes = true;
  late List<AppointmentTypeModel> appointmentTypes = [];
  late List<AppointmentTypeModel> filteredAppointmentTypes = [];
  List<int> teethSelected = [];

  NewAppointmentProvider() {
    load();
  }

  void load() {
    AppointmentTypeService.getAppointmentTypes().then((value) {
      appointmentTypes = value;
      filteredAppointmentTypes = value;
      isLoadingAppointmentTypes = false;
      notifyListeners();
    });
    ProcedureTypeService.getProcedureTypes().then((value) {
      isLoadingProcedureTypes = false;
      procedureTypes = value;
      filteredProcedureTypes = value;
      notifyListeners();
    });
    DentistService.names().then((value) {
      isLoadingDoctors = false;
      doctors = value;
      notifyListeners();
    });
    PatientService.names().then((value) {
      isLoadingPatients = false;
      patients = value;
      filteredPatients = value;
      notifyListeners();
    });
    NurseService.names().then((value) {
      isLoadingNurses = false;
      nurses = value;
      notifyListeners();
    },);
  }

  void openOrCloseModal(BuildContext context) {
    showNewAppointmentModel = !showNewAppointmentModel;
    showBarrier = !showBarrier;
    if(showNewAppointmentModel) {
      page = 0;
      progress = 1 / 8;
      notifyListeners();
      pageController.jumpToPage(0);
    }
    notifyListeners();
  }

  void addAppointment(BuildContext context) async {
    if (validate()) {
      isRegistering = true;
      notifyListeners();
      try {
        model = await AppointmentService.insert(model);
        notifyListeners();
        isRegistering = false;
        showNewAppointmentModel = false;
        showBarrier = false;
        notifyListeners();
        if (!context.mounted) return;
        toastification.show(
          title: Text("Sucesso!"),
          description: Text("Consulta cadastrada com sucesso"),
          autoCloseDuration: Duration(seconds: 10),
          showProgressBar: true,
          style: ToastificationStyle.minimal,
          type: ToastificationType.success,
          primaryColor: AppColors.secondary,
        );
        context.router.pop(true);
      } catch (e) {
        isRegistering = false;
        notifyListeners();
        toastification.show(
          title: Text("Falha ao cadastrar!"),
          description: Text("Falha ao cadastrar consulta"),
          autoCloseDuration: Duration(seconds: 10),
          showProgressBar: true,
          style: ToastificationStyle.minimal,
          type: ToastificationType.error,
          primaryColor: AppColors.error,
        );
      }
    } else {
      toastification.show(
        title: Text("Falha ao cadastrar!"),
        description: Text("Preencha todos os campos obrigatórios"),
        type: ToastificationType.warning,
        primaryColor: AppColors.warning,
        autoCloseDuration: Duration(seconds: 10),
        showProgressBar: true,
        style: ToastificationStyle.minimal,
      );
    }
  }

  void clear() {
    page = 0;
    progress = 1 / 8;
    showNewAppointmentModel = false;
    showBarrier = false;
    isRegistering = false;
    tecNotes.text = "";
    isLoadingPatients = true;
    isLoadingDoctors = true;
    isLoadingNurses = true;
    isLoadingProcedureTypes = true;
    isLoadingAppointmentTypes = true;
  }

  Future<bool> goToNewAppointment(BuildContext context, DateTime date, bool putTime) async {
    model.date = date;
    notifyListeners();
    return await context.router.push(NewAppointmentPage.query());
  }

  bool validate() {
    bool isValidated = true;
    String message = "";
    if(page == 0 && (model.patient!.fullName.isEmpty || model.patient!.uuid.isEmpty)) {
      isValidated = false;
      message = "É necessário selecionar um paciente";
    } else if(page == 1 && model.appointmentType!.uuid.isEmpty) {
      isValidated = false;
      message = "É necessário selecionar um tipo de consulta";
    } else if(page == 2 && model.procedureTypes.isEmpty) {
      isValidated = false;
      message = "É necessário selecionar ao menos um procedimento";
    } else if(page == 3 && model.doctor!.uuid.isEmpty) {
      isValidated = false;
      message = "É necessário selecionar um dentista";
    } else if(page == 5 && model.startTime.hour == 0 && model.startTime.minute == 0 && model.endTime.hour == 0 && model.endTime.minute == 0) {
      isValidated = false;
      message = "É necessário selecionar um horário";
    }
    if(!isValidated) {
      toastification.show(
        title: Text(message, style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),),
        primaryColor: AppColors.warning,
        style: ToastificationStyle.minimal,
        type: ToastificationType.warning,
        autoCloseDuration: Duration(seconds: 10),
        showProgressBar: true,
      );
    }
    return isValidated;
  }

  void previousPage() {
    page--;
    progress -= 1 / 7;
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  void nextPage() {
    if(!validate()){
      return;
    }
    page++;
    progress += 1 / 7;
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  void filterPatients(String searchTerm) {
    filteredPatients = patients.where((element) => element.fullName.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    notifyListeners();
  }

  void filterProcedureTypes(String searchTerm) {
    filteredProcedureTypes = procedureTypes.where((element) => element.name.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    notifyListeners();
  }

  void filterAppointmentTypes(String searchTerm) {
    filteredAppointmentTypes = appointmentTypes.where((element) => element.name.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    notifyListeners();
  }

  void getFreeTime() {
    if(model.doctor!.uuid != null && model.doctor!.uuid.isNotEmpty && model.procedureTypes.isNotEmpty) {
      DentistService.freeTime(model.doctor!.uuid!, model.date, model.procedureTypes!.map((e) => e.uuid).toList())
          .then((value) {
        timeRanges = value.timeRanges;
        notifyListeners();
      },);
    }
  }

  void addProcedureType(ProcedureTypeModel model) {
    this.model.procedureTypes!.add(model);
    getFreeTime();
    notifyListeners();
  }

  void removeProcedureType(ProcedureTypeModel model) {
    this.model.procedureTypes!.remove(model);
    if(this.model.procedureTypes.isEmpty) {
      timeRanges = [];
    }
    notifyListeners();
  }

  void updatePatient(UserModel model) {
    this.model.patient = model;
    notifyListeners();
  }

  void updateDoctor(UserModel model) {
    this.model.doctor = model;
    getFreeTime();
    notifyListeners();
  }

  void updateNurse(UserModel model) {
    this.model.nurse = model;
    notifyListeners();
  }

  void updateAppointmentType(AppointmentTypeModel model) {
    this.model.appointmentType = model;
    notifyListeners();
  }

  void updateProcedureType(List<ProcedureTypeModel> model) {
    this.model.procedureTypes = model;
    notifyListeners();
  }

  void updateDate(DateTime date) {
    model.date = date;
    model.startTime = TimeOfDay(hour: 0, minute: 0);
    model.endTime = TimeOfDay(hour: 0, minute: 0);
    getFreeTime();
    notifyListeners();
  }

  void addTeeth(ToothCode tooth) {
    model.teeth!.add(tooth);
    notifyListeners();
  }

  void removeTeeth(ToothCode tooth) {
    model.teeth!.add(tooth);
    notifyListeners();
  }

  void selectTimeRange(TimeRange timeRange) {
    model.startTime = timeRange.startTime;
    model.endTime = timeRange.endTime;
    notifyListeners();
  }

}
