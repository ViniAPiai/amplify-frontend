part of 'side_bar.dart';

class SideBarProvider extends ChangeNotifier {

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  bool showNewAppointmentModal = false;
  bool showBarrier = false;
  DateTime? selectedDate;

  void openOrCloseNewAppointmentModal({required BuildContext context, DateTime? date}) {
    showNewAppointmentModal = !showNewAppointmentModal;
    showBarrier = !showBarrier;
    selectedDate = date ?? DateTime.now();
    notifyListeners();
  }

}
