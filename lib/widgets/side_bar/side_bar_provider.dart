part of 'side_bar_screen.dart';

class SideBarProvider extends ChangeNotifier {

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  String selected = 'Dashboard';

  void setSelected(String selected) {
    this.selected = selected;
    notifyListeners();
  }

}
