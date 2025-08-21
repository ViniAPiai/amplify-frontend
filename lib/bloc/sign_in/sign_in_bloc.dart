import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SubmitSignIn>(_onSubmit);
  }

  Future<void> _onSubmit(SubmitSignIn event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, success: false));

    try {
      final api = await ApiService.create(withAuth: false);
      print(state.email);
      print(state.password);
      final response = await api.client.signIn(
        AuthRequestModel(email: state.email, password: state.password),
      );

      if (response.token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", response.token);
        prefs.setString("expiresIn", response.expiresIn.toIso8601String());

        emit(state.copyWith(isLoading: false, success: true));
      } else {
        emit(state.copyWith(isLoading: false, error: "Token vazio"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
