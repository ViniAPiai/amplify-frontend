import 'package:flutter/material.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/services/api_service.dart';
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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    if(token != null) {
      UserModel user = await (await ApiService.create()).client.me();
      final code = user.languageCode ?? 'pt';
      final parts = code.split('_');
      _locale = Locale(parts[0], parts.length > 1 ? parts[1] : null);
    } else {
      _locale = const Locale('pt', 'PT');
    }
    notifyListeners();
  }
}
