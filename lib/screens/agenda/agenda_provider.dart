part of 'agenda_screen.dart';

class AgendaProvider extends ChangeNotifier {

  GlobalKey<MonthViewState> monthKey = GlobalKey<MonthViewState>();
  GlobalKey<WeekViewState> weekKey = GlobalKey<WeekViewState>();
  GlobalKey<DayViewState> dayKey = GlobalKey<DayViewState>();
  EventController controller = EventController();
  int selectedIndex = 2;

  AgendaProvider() {
    SharedPreferences.getInstance().then((prefs) {
      selectedIndex = prefs.getInt("agenda_selected_type") ?? 2;
      notifyListeners();
    });
  }

  void toggle(int index) async {
    selectedIndex = index;
    (await SharedPreferences.getInstance()).setInt("agenda_selected_type", index);
    notifyListeners();
  }

  void nextMonth() {
    monthKey.currentState!.nextPage();
    notifyListeners();
  }

  void previousMonth() {
    monthKey.currentState!.previousPage();
    notifyListeners();
  }

  void nextWeek() {
    weekKey.currentState!.nextPage();
    notifyListeners();
  }

  void previousWeek() {
    weekKey.currentState!.previousPage();
    notifyListeners();
  }

  void setWeek(DateTime week) {
    weekKey.currentState!.animateToWeek(week);
    notifyListeners();
  }

}
