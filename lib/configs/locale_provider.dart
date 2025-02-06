import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('pt', 'PT');

  Locale get locale => _locale;

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
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    String? countryCode = prefs.getString('country_code');

    if (languageCode != null) {
      _locale = Locale(languageCode, countryCode?.isNotEmpty == true ? countryCode : null);
      notifyListeners();
    }
  }
}
