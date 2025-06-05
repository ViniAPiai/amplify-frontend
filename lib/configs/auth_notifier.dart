import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {

  AuthNotifier() {
    init();
  }

  bool isLoading = true;
  bool isLoggedIn = false;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
    await sharedPreferences.remove("expiresIn");

    isLoggedIn = false;
    notifyListeners();
  }

  Future<bool> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? expiresInString = sharedPreferences.getString("expiresIn");
    if (!sharedPreferences.containsKey("token") || !sharedPreferences.containsKey("expiresIn")) {
      isLoggedIn = false;
      notifyListeners();
    } else if(expiresInString == null) {
      isLoggedIn = false;
      notifyListeners();
    } else {
      final DateTime expiresIn = DateTime.parse(expiresInString);
      bool isExpired = DateTime.now().isBefore(expiresIn);
      isLoggedIn = !isExpired;
      notifyListeners();
    }
    return isLoggedIn;
  }

}
