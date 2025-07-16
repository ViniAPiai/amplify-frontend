import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final expiresInString = prefs.getString('expiresIn');

    if (token == null || expiresInString == null) {
      emit(Unauthenticated());
      return;
    }

    final expiresIn = DateTime.tryParse(expiresInString);
    final isExpired = expiresIn == null || DateTime.now().isAfter(expiresIn);

    emit(isExpired ? Unauthenticated() : Authenticated());
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    emit(Authenticated());
  }

  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('expiresIn');
    emit(Unauthenticated());
  }
}
