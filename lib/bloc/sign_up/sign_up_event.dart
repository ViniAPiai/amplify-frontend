import 'package:equatable/equatable.dart';
import 'package:frontend/models/simple/simple_response.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpLoad extends SignUpEvent {}

class SignUpEdit extends SignUpEvent {
  final String patientUuid;

  const SignUpEdit({required this.patientUuid});

  @override
  List<Object?> get props => [patientUuid];
}

class SignUpValidate extends SignUpEvent {}

class SignUpSubmit extends SignUpEvent {}

class PreviousStep extends SignUpEvent {}

class NextStep extends SignUpEvent {}

class LoadCountries extends SignUpEvent {}

class LoadStates extends SignUpEvent {
  final String country;

  const LoadStates({required this.country});
}

class LoadCities extends SignUpEvent {
  final String state;

  const LoadCities({required this.state});
}

class UpdateCountry extends SignUpEvent {
  final SimpleResponse country;

  const UpdateCountry({required this.country});

  @override
  List<Object?> get props => [country];
}

class UpdateState extends SignUpEvent {
  final SimpleResponse state;

  const UpdateState({required this.state});

  @override
  List<Object?> get props => [state];
}

class UpdateCity extends SignUpEvent {
  final SimpleResponse city;

  const UpdateCity({required this.city});

  @override
  List<Object?> get props => [city];
}

class UpdateFields extends SignUpEvent {
  final int? step;
  final bool? showPassword;
  final String? gender;
  final String? email;
  final String? fullName;
  final String? documentNumber;
  final String? password;
  final String? confirmPassword;
  final String? street;
  final String? number;
  final String? complement;
  final String? neighborhood;
  final String? zipCode;
  final DateTime? birthDate;
  final String? phoneNumber;
  final String? healthNumber;
  final String? nationalRegistry;
  final String? nationalRegistryExpirationDate;
  final String? occupation;

  const UpdateFields({
    this.step,
    this.showPassword,
    this.gender,
    this.email,
    this.fullName,
    this.documentNumber,
    this.password,
    this.confirmPassword,
    this.street,
    this.number,
    this.complement,
    this.neighborhood,
    this.zipCode,
    this.birthDate,
    this.phoneNumber,
    this.healthNumber,
    this.nationalRegistry,
    this.nationalRegistryExpirationDate,
    this.occupation,
  });

  @override
  List<Object?> get props => [
        step,
        showPassword,
        gender,
        email,
        fullName,
        documentNumber,
        password,
        confirmPassword,
        street,
        number,
        complement,
        neighborhood,
        zipCode,
        birthDate,
        phoneNumber,
        healthNumber,
        nationalRegistry,
        nationalRegistryExpirationDate,
        occupation,
      ];
}
