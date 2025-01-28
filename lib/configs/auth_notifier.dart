import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ValueNotifier<bool> {
  bool isLoading = true;

  AuthNotifier() : super(false) {
    _initialize();
  }

  Future<void> _initialize() async {
    await isAuthenticated();
    isLoading = false;
    notifyListeners();
  }

  void login() {
    value = true;
  }

  void logout() {
    value = false;
  }

  Future<void> isAuthenticated() async {
    try {
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      if (!sharedPreferences.containsKey("token") ||
          !sharedPreferences.containsKey("expiresIn")) {
        value = false;
        return;
      }

      final String? expiresInString = sharedPreferences.getString("expiresIn");
      if (expiresInString == null) {
        value = false;
        return;
      }

      final DateTime expiresIn = DateTime.parse(expiresInString);
      print("Data expirada");
      value = expiresIn.isAfter(DateTime.now());
    } catch (e) {
      value = false; // Se houver erro, considera o usuário não autenticado
      print('Erro ao verificar autenticação: $e');
    }
  }
}
