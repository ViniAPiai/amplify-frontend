import 'package:equatable/equatable.dart';
import 'package:frontend/models/simple/simple_response.dart';

class SignUpState extends Equatable {
  final bool showPassword;
  final String city;
  final String state;
  final String country;
  final String gender;
  final String email;
  final String fullName;
  final String documentNumber;
  final String password;
  final String confirmPassword;
  final String street;
  final String number;
  final String complement;
  final String district;
  final String zipCode;
  final String birthDate;
  final String phoneNumber;
  final String healthNumber;
  final String nationalRegistry;
  final String nationalRegistryExpirationDate;
  final String occupation;
  final bool isLoadingCountries;
  final bool isLoadingStates;
  final bool isLoadingCities;
  final List<SimpleResponse> countries;
  final List<SimpleResponse> states;
  final List<SimpleResponse> cities;

  const SignUpState({
    this.showPassword = false,
    this.city = "",
    this.state = "",
    this.country = "",
    this.gender = "",
    this.email = "",
    this.fullName = "",
    this.documentNumber = "",
    this.password = "",
    this.confirmPassword = "",
    this.street = "",
    this.number = "",
    this.complement = "",
    this.district = "",
    this.zipCode = "",
    this.birthDate = "",
    this.phoneNumber = "",
    this.healthNumber = "",
    this.nationalRegistry = "",
    this.nationalRegistryExpirationDate = "",
    this.occupation = "",
    this.isLoadingCountries = true,
    this.isLoadingStates = false,
    this.isLoadingCities = false,
    this.countries = const [],
    this.states = const [],
    this.cities = const [],
  });

  SignUpState copyWith({
    bool? showPassword,
    String? city,
    String? state,
    String? country,
    String? gender,
    String? email,
    String? fullName,
    String? documentNumber,
    String? password,
    String? confirmPassword,
    String? street,
    String? number,
    String? complement,
    String? district,
    String? zipCode,
    String? birthDate,
    String? phoneNumber,
    String? healthNumber,
    String? nationalRegistry,
    String? nationalRegistryExpirationDate,
    String? occupation,
    bool? isLoadingCountries,
    bool? isLoadingStates,
    bool? isLoadingCities,
    List<SimpleResponse>? countries,
    List<SimpleResponse>? states,
    List<SimpleResponse>? cities,
  }) {
    return SignUpState(
      showPassword: showPassword ?? this.showPassword,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      documentNumber: documentNumber ?? this.documentNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      street: street ?? this.street,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      district: district ?? this.district,
      zipCode: zipCode ?? this.zipCode,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      healthNumber: healthNumber ?? this.healthNumber,
      nationalRegistry: nationalRegistry ?? this.nationalRegistry,
      nationalRegistryExpirationDate: nationalRegistryExpirationDate ?? this.nationalRegistryExpirationDate,
      occupation: occupation ?? this.occupation,
      isLoadingCountries: isLoadingCountries ?? this.isLoadingCountries,
      isLoadingStates: isLoadingStates ?? this.isLoadingStates,
      isLoadingCities: isLoadingCities ?? this.isLoadingCities,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => [];
}
