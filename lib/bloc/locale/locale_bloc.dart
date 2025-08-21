
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(Locale('pt', 'PT'))) {
    on<LoadSavedLocale>(_onLoadSavedLocale);
    on<ChangeLocale>(_onChangeLocale);
  }

  Future<void> _onLoadSavedLocale(
      LoadSavedLocale event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Locale locale;
    if (token != null) {
      try {
        final user = await (await ApiService.create()).client.me();
        final code = user.languageCode ?? 'pt_PT';
        final parts = code.split('_');
        locale = Locale(parts[0], parts.length > 1 ? parts[1] : null);
      } catch (_) {
        locale = const Locale('pt', 'PT');
      }
    } else {
      locale = const Locale('pt', 'PT');
    }

    emit(LocaleState(locale));
  }

  Future<void> _onChangeLocale(
      ChangeLocale event, Emitter<LocaleState> emit) async {
    final locale = event.locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    await prefs.setString('country_code', locale.countryCode ?? '');
    emit(LocaleState(locale));
  }
}
