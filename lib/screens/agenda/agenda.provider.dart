part of 'agenda.dart';

class AgendaProvider extends ChangeNotifier {
  GlobalKey<MonthViewState> monthKey = GlobalKey<MonthViewState>();
  GlobalKey<WeekViewState> weekKey = GlobalKey<WeekViewState>();
  GlobalKey<DayViewState> dayKey = GlobalKey<DayViewState>();
  GlobalKey<FormState> consultationKey = GlobalKey<FormState>();
  EventController controller = EventController();
  CalendarEventData? currentEvent;
  int selectedIndex = 2;
  bool isLoadingConsultation = true;
  bool isLoaded = true;
  bool showBarrier = false;
  bool showConsultationModal = false;
  bool isEditing = false;
  bool isFinished = false;
  DateTime? lastLoadedMonth;

  AgendaProvider() {
    SharedPreferences.getInstance().then((prefs) {
      selectedIndex = prefs.getInt("agenda_selected_type") ?? 2;
      notifyListeners();
    });
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
    if (lastLoadedMonth != null && lastLoadedMonth!.day == date.day && lastLoadedMonth!.month == date.month && lastLoadedMonth!.year == date.year) {
      return;
    }
    controller.removeWhere(
      (event) => true,
    );
    List<CalendarEventData> events = await getEvents(date);
    controller.addAll(events);
    isLoadingConsultation = false;
    lastLoadedMonth = date;
    notifyListeners();
  }

  Future<List<CalendarEventData>> getEvents(DateTime date) async {
    AppointmentIntervalEnum interval = AppointmentIntervalEnum.values[selectedIndex];
    List<AppointmentModel> consultations =
        await (await ApiService.create()).client.secretaryAgenda(AgendaRequestModel(interval: interval, day: date));
    List<CalendarEventData> events = consultations
        .map(
          (e) => CalendarEventData(
              title: e.patient!.fullName,
              date: e.date,
              startTime: DateTime(e.date.year, e.date.month, e.date.day, e.startTime.hour, e.startTime.minute),
              endTime: DateTime(e.date.year, e.date.month, e.date.day, e.endTime.hour, e.endTime.minute),
              endDate: e.date,
              color: e.status!.color,
              description: e.notes,
              event: e),
        )
        .toList();
    return events;
  }

  void updateEvent(CalendarEventData currentEvent, CalendarEventData newEvent) {
    controller.update(currentEvent, newEvent);
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
}
