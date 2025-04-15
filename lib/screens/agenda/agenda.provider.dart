part of 'agenda.dart';

class AgendaProvider extends ChangeNotifier {
  GlobalKey<MonthViewState> monthKey = GlobalKey<MonthViewState>();
  GlobalKey<WeekViewState> weekKey = GlobalKey<WeekViewState>();
  GlobalKey<DayViewState> dayKey = GlobalKey<DayViewState>();
  GlobalKey<FormState> consultationKey = GlobalKey<FormState>();
  EventController controller = EventController();
  CalendarEventData? currentEvent;
  int selectedIndex = 2;
  bool isLoadingConsultation = false;
  bool isLoaded = true;
  bool showBarrier = false;
  bool showConsultationModal = false;
  bool isEditing = false;
  bool isFinished = false;
  DateTime? lastLoadedMonth;
  List<UserModel> doctors = [];
  List<UserModel> nurses = [];

  String? uuid;
  TextEditingController tecConsultationDescription = TextEditingController();
  DateTime consultationDate = DateTime.now();
  TimeOfDay consultationStartTime = TimeOfDay(hour: 12, minute: 0);
  TimeOfDay consultationEndTime = TimeOfDay(hour: 13, minute: 0);
  UserModel? patient;
  UserModel? doctor;
  UserModel? nurse;

  AgendaProvider() {
    SharedPreferences.getInstance().then((prefs) {
      selectedIndex = prefs.getInt("agenda_selected_type") ?? 2;
      notifyListeners();
    });
    loadUsers();
  }

  void toggle(int index) async {
    selectedIndex = index;
    (await SharedPreferences.getInstance()).setInt("agenda_selected_type", index);
    /*switch (index) {
      case 0:
        calendarController.view = CalendarView.day;
        break;
      case 1:
        calendarController.view = CalendarView.week;
        break;
      case 2:
        calendarController.view = CalendarView.month;
        break;
    }*/
    notifyListeners();
    getEvents(DateTime.now());
  }

  Future<void> loadEventsByDate(DateTime date) async {
    if(lastLoadedMonth != null && lastLoadedMonth!.day == date.day && lastLoadedMonth!.month == date.month && lastLoadedMonth!.year == date.year){
      return;
    }
    isLoadingConsultation = true;
    notifyListeners();
    controller.removeWhere((event) => true,);
    List<CalendarEventData> events = await getEvents(date);
    controller.addAll(events);
    isLoadingConsultation = false;
    lastLoadedMonth = date;
    notifyListeners();
  }

  Future<List<CalendarEventData>> getEvents(DateTime date) async {
    ConsultationIntervalEnum interval = ConsultationIntervalEnum.values[selectedIndex];
    List<ConsultationModel> consultations = await ConsultationService.secretaryAgenda(interval, date);
    List<CalendarEventData> events = consultations
        .map(
          (e) => CalendarEventData(
              title: e.patient!.fullName,
              date: e.startTime,
              startTime: e.startTime,
              endTime: e.endTime,
              endDate: e.endTime,
              color: e.status!.color,
              description: e.description,
              event: e.uuid),
        )
        .toList();
    return events;
  }

  void openAddConsultation({DateTime? date, CalendarEventData? event}) async {
    if (event != null) {
      ConsultationModel consultation = await ConsultationService.findByUuid(event.event as String);
      tecConsultationDescription.text = consultation.description!;
      consultationDate = event.date;
      consultationStartTime = TimeOfDay(hour: event.startTime!.hour, minute: event.startTime!.minute);
      consultationEndTime = TimeOfDay(hour: event.endTime!.hour, minute: event.endTime!.minute);
      patient = consultation.patient!;
      doctor = consultation.doctor!;
      isEditing = true;
      isFinished = consultation.status == ConsultationStatusEnum.finished;
      uuid = event.event! as String;
      currentEvent = event;
      notifyListeners();
    } else {
      consultationDate = date ?? DateTime.now();
      consultationStartTime = date != null ? TimeOfDay(hour: date.hour, minute: date.minute) : TimeOfDay(hour: 12, minute: 0);
      consultationEndTime = date != null ? TimeOfDay(hour: date.hour + 1, minute: date.minute) : TimeOfDay(hour: 13, minute: 0);
      tecConsultationDescription.text = "";
      isEditing = false;
      notifyListeners();
    }
    showBarrier = !showBarrier;
    showConsultationModal = !showConsultationModal;
    notifyListeners();
  }

  Future<ConsultationModel> addConsultation(BuildContext context) async {
    ConsultationModel model = ConsultationModel(
        description: tecConsultationDescription.text,
        startTime:
            DateTime(consultationDate.year, consultationDate.month, consultationDate.day, consultationStartTime.hour, consultationStartTime.minute),
        endTime: DateTime(consultationDate.year, consultationDate.month, consultationDate.day, consultationEndTime.hour, consultationEndTime.minute),
        patient: patient,
        doctor: doctor,
        nurse: nurse);
    try {
      model = await ConsultationService.insert(model);
      CalendarEventData event = CalendarEventData(
          title: model.patient!.fullName,
          date: model.startTime,
          startTime: model.startTime,
          endTime: model.endTime,
          endDate: model.endTime,
          color: model.status!.color,
          description: model.description,
          event: model.uuid);
      controller.add(event);
      showBarrier = !showBarrier;
      showConsultationModal = !showConsultationModal;
      notifyListeners();
      return model;
    } catch (e) {
      rethrow;
    }
  }

  void updateConsultation(BuildContext context) async {
    ConsultationModel model = ConsultationModel(
        uuid: uuid,
        description: tecConsultationDescription.text,
        startTime:
            DateTime(consultationDate.year, consultationDate.month, consultationDate.day, consultationStartTime.hour, consultationStartTime.minute),
        endTime: DateTime(consultationDate.year, consultationDate.month, consultationDate.day, consultationEndTime.hour, consultationEndTime.minute),
        patient: patient,
        doctor: doctor,
        nurse: nurse);
    model = await ConsultationService.update(model);
    CalendarEventData event = CalendarEventData(
        title: model.patient!.fullName,
        date: model.startTime,
        startTime: model.startTime,
        endTime: model.endTime,
        endDate: model.endTime,
        color: model.status!.color,
        description: model.description,
        event: model.uuid);
    controller.update(currentEvent!, event);
    showBarrier = !showBarrier;
    showConsultationModal = !showConsultationModal;
    notifyListeners();
    PanaraInfoDialog.showAnimatedFromRight(context,
        message: context.getMessage(model.message!), buttonText: "OK", onTapDismiss: () => context.pop(), panaraDialogType: PanaraDialogType.success);
  }

  void updateEvent(CalendarEventData currentEvent, CalendarEventData newEvent) {
    controller.update(currentEvent, newEvent);
    notifyListeners();
  }

  void confirmConsultation(BuildContext context, CalendarEventData event) async {
    AppLocalizations t = AppLocalizations.of(context)!;
    AmplifyDialog.question(context, message: t.thePatientRequestedAnConsultation(event.title), onTapConfirm: () async {
      ConsultationModel consultationModel = await ConsultationService.confirm(event.event! as String);
      CalendarEventData eventData = CalendarEventData(
        title: consultationModel.patient!.fullName,
        date: consultationModel.startTime,
        startTime: consultationModel.startTime,
        endTime: consultationModel.endTime,
        endDate: consultationModel.endTime,
        color: consultationModel.status!.color,
        event: consultationModel.uuid,
      );
      updateEvent(event, eventData);
      context.pop();
      PanaraInfoDialog.show(context, message: context.getMessage(consultationModel.message!), buttonText: "Ok!", onTapDismiss: () {
        context.pop();
      }, panaraDialogType: PanaraDialogType.normal);
    });
  }

  void loadUsers() {
    DoctorService.names().then((value) => doctors.addAll(value));
    NurseService.names().then((value) => nurses.addAll(value));
    notifyListeners();
  }

  void nextMonth() {
    monthKey.currentState!.nextPage();
  }

  void previousMonth() {
    monthKey.currentState!.previousPage();
  }

  void setMonth(DateTime month) {
    monthKey.currentState!.animateToMonth(month);
  }

  void nextWeek() {
    weekKey.currentState!.nextPage();
  }

  void previousWeek() {
    weekKey.currentState!.previousPage();
  }

  void setWeek(DateTime week) {
    weekKey.currentState!.animateToWeek(week);
  }

  void nextDay() {
    dayKey.currentState!.nextPage();
  }

  void previousDay() {
    dayKey.currentState!.previousPage();
  }

  void setDay(DateTime day) {
    dayKey.currentState!.animateToDate(day);
  }

  void updatePatient(UserModel model) {
    patient = model;
    notifyListeners();
  }

  void updateDoctor(UserModel model) {
    doctor = model;
    notifyListeners();
  }

  void updateNurse(UserModel model) {
    nurse = model;
    notifyListeners();
  }

  void updateConsultationDate(DateTime date) {
    consultationDate = date;
    notifyListeners();
  }

  void updateConsultationStartTime(TimeOfDay time) {
    consultationStartTime = time;
    notifyListeners();
  }

  void updateConsultationEndTime(TimeOfDay time) {
    consultationEndTime = time;
    notifyListeners();
  }
}
