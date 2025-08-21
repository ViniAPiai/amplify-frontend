import 'package:equatable/equatable.dart';
import 'package:frontend/enums/form_validation.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/models/simple/simple_response.dart';

class SignUpState extends Equatable {
  final String patientUuid;
  final FormValidation formValidation;
  final bool isLoadingClinicCountry;
  final String clinicCountry;
  final int step;
  final bool showPassword;
  final SimpleResponse city;
  final SimpleResponse state;
  final SimpleResponse country;
  final String gender;
  final String email;
  final String fullName;
  final String documentNumber;
  final String password;
  final String confirmPassword;
  final String street;
  final String number;
  final String complement;
  final String neighborhood;
  final String zipCode;
  final DateTime birthDate;
  final String phoneNumber;
  final String healthNumber;
  final String occupation;
  final bool isLoadingCountries;
  final bool isLoadingStates;
  final bool isLoadingCities;
  final List<SimpleResponse> countries;
  final List<SimpleResponse> states;
  final List<SimpleResponse> cities;
  final bool successSubmittingForm;
  final MessageModel message;
  final String error;

  const SignUpState({
    required this.birthDate,
    required this.city,
    required this.state,
    required this.country,
    required this.message,
    this.patientUuid = "",
    this.formValidation = FormValidation.none,
    this.isLoadingClinicCountry = true,
    this.clinicCountry = "",
    this.step = 0,
    this.showPassword = false,
    this.gender = "",
    this.email = "",
    this.fullName = "",
    this.documentNumber = "",
    this.password = "",
    this.confirmPassword = "",
    this.street = "",
    this.number = "",
    this.complement = "",
    this.neighborhood = "",
    this.zipCode = "",
    this.phoneNumber = "",
    this.healthNumber = "",
    this.occupation = "",
    this.isLoadingCountries = true,
    this.isLoadingStates = false,
    this.isLoadingCities = false,
    this.countries = const [],
    this.states = const [],
    this.cities = const [],
    this.successSubmittingForm = false,
    this.error = "",
  });

  SignUpState copyWith({
    String? patientUuid,
    FormValidation? formValidation,
    bool? isLoadingClinicCountry,
    String? clinicCountry,
    int? step,
    bool? showPassword,
    SimpleResponse? city,
    SimpleResponse? state,
    SimpleResponse? country,
    String? gender,
    String? email,
    String? fullName,
    String? documentNumber,
    String? password,
    String? confirmPassword,
    String? street,
    String? number,
    String? complement,
    String? neighborhood,
    String? zipCode,
    DateTime? birthDate,
    String? phoneNumber,
    String? healthNumber,
    String? occupation,
    bool? isLoadingCountries,
    bool? isLoadingStates,
    bool? isLoadingCities,
    List<SimpleResponse>? countries,
    List<SimpleResponse>? states,
    List<SimpleResponse>? cities,
    MessageModel? message,
    bool? successSubmittingForm,
    String? error,
  }) {
    return SignUpState(
      patientUuid: patientUuid ?? this.patientUuid,
      formValidation: formValidation ?? this.formValidation,
      isLoadingClinicCountry: isLoadingClinicCountry ?? this.isLoadingClinicCountry,
      clinicCountry: clinicCountry ?? this.clinicCountry,
      step: step ?? this.step,
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
      neighborhood: neighborhood ?? this.neighborhood,
      zipCode: zipCode ?? this.zipCode,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      healthNumber: healthNumber ?? this.healthNumber,
      occupation: occupation ?? this.occupation,
      isLoadingCountries: isLoadingCountries ?? this.isLoadingCountries,
      isLoadingStates: isLoadingStates ?? this.isLoadingStates,
      isLoadingCities: isLoadingCities ?? this.isLoadingCities,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
      message: message ?? this.message,
      successSubmittingForm: successSubmittingForm ?? this.successSubmittingForm,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        patientUuid,
        formValidation,
        isLoadingClinicCountry,
        clinicCountry,
        step,
        showPassword,
        city,
        state,
        country,
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
        occupation,
        isLoadingCountries,
        isLoadingStates,
        isLoadingCities,
        countries,
        states,
        cities,
        message,
        successSubmittingForm,
        error,
      ];
}
