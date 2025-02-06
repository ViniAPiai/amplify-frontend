import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ValueNotifier<bool> {
  bool isLoading = true;

  AuthNotifier() : super(false) {
    _initialize();
  }

  Future<void> _initialize() async {
    value = await isAuthenticated();
    isLoading = false;
    notifyListeners();
  }

  void login() {
    value = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
    await sharedPreferences.remove("expiresIn");

    value = false;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    try {
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      if (!sharedPreferences.containsKey("token") ||
          !sharedPreferences.containsKey("expiresIn")) {
        return false;
      }

      final String? expiresInString = sharedPreferences.getString("expiresIn");
      if (expiresInString == null) {
        return false;
      }

      final DateTime expiresIn = DateTime.parse(expiresInString);
      return DateTime.now().isBefore(expiresIn);
    } catch (e) {
      print('Erro ao verificar autenticação: $e');
      return false;
    }
  }
}
