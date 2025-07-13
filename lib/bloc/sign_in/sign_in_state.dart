import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;
  final bool success;
  final String? error;

  const SignInState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.success,
    this.error,
  });

  factory SignInState.initial() => const SignInState(
    email: 'tester.secretary@example.com',
    password: 'T&ste1',
    isLoading: false,
    success: false,
  );

  SignInState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? success,
    String? error,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      error: error,
    );
  }

  @override
  List<Object?> get props => [email, password, isLoading, success, error];
}
