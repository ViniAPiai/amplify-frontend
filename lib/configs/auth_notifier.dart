import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  bool isLoading = true;
  bool isLoggedIn = false;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
    await sharedPreferences.remove("expiresIn");

    isLoggedIn = false;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    try {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      if (!sharedPreferences.containsKey("token") || !sharedPreferences.containsKey("expiresIn")) {
        isLoggedIn = false;
        notifyListeners();
        return false;
      }

      final String? expiresInString = sharedPreferences.getString("expiresIn");
      if (expiresInString == null) {
        isLoggedIn = false;
        notifyListeners();
        return false;
      }

      final DateTime expiresIn = DateTime.parse(expiresInString);
      bool isExpired = DateTime.now().isBefore(expiresIn);
      if (isExpired) {
        isLoggedIn = false;
        notifyListeners();
        return false;
      }
      isLoggedIn = true;
      notifyListeners();
      return true;
    } catch (e) {
      print('Erro ao verificar autenticação: $e');
      return false;
    }
  }

}
