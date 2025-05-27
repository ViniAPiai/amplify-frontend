import 'package:flutter/material.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale get locale => _locale ?? const Locale('pt', 'PT');

  String getLocaleString() {
    return "${locale.languageCode}${locale.countryCode != null ? "_${locale.countryCode}" : ""}";
  }

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    await _saveLocale(locale);
  }

  Future<void> _saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    await prefs.setString('country_code', locale.countryCode ?? '');
  }

  Future<void> _loadSavedLocale() async {
    UserModel user = await UserService.me();
    final code = user.languageCode ?? 'pt';
    final parts = code.split('_');
    _locale = Locale(parts[0], parts.length > 1 ? parts[1] : null);
    notifyListeners();
    /*final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    String? countryCode = prefs.getString('country_code');

    if (languageCode != null) {
      _locale = Locale(languageCode, countryCode?.isNotEmpty == true ? countryCode : null);
      notifyListeners();
    }*/
  }
}
