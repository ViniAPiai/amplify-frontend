part of 'test_screen.dart';

class TestProvider extends ChangeNotifier {

  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

}
