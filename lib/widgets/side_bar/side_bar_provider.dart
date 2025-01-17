part of 'side_bar_screen.dart';

class SideBarProvider extends ChangeNotifier {

  String selected = '1';

  void setSelected(String selected) {
    this.selected = selected;
    notifyListeners();
  }

}
