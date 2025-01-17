part of 'landing_screen.dart';

class LandingProvider extends ChangeNotifier {

  PageController controller = PageController(initialPage: 0);

  void setPage(int page) {
    controller.animateToPage(page, duration: Duration(seconds: 1), curve: Curves.easeIn);
    notifyListeners();
  }

}
