import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpSubmit extends SignUpEvent {}

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
  final String country;

  const UpdateCountry(this.country);

  @override
  List<Object?> get props => [country];
}

class UpdateState extends SignUpEvent {
  final String state;

  const UpdateState(this.state);

  @override
  List<Object?> get props => [state];
}

class UpdateCity extends SignUpEvent {
  final String city;

  const UpdateCity(this.city);

  @override
  List<Object?> get props => [city];
}

class UpdateFields extends SignUpEvent {
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
  final String? district;
  final String? zipCode;
  final String? birthDate;
  final String? phoneNumber;
  final String? healthNumber;
  final String? nationalRegistry;
  final String? nationalRegistryExpirationDate;
  final String? occupation;

  const UpdateFields({
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
    this.district,
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
        district,
        zipCode,
        birthDate,
        phoneNumber,
        healthNumber,
        nationalRegistry,
        nationalRegistryExpirationDate,
        occupation,
      ];
}
