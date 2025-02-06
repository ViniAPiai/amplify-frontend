part of 'side_bar_screen.dart';

class SideBarProvider extends ChangeNotifier {

  String selected = 'Dashboard';

  void setSelected(String selected) {
    this.selected = selected;
    notifyListeners();
  }

}
