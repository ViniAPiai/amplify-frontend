import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/sign_up/sign_up_event.dart';
import 'package:frontend/bloc/sign_up/sign_up_state.dart';
import 'package:frontend/enums/form_validation.dart';
import 'package:frontend/models/address/address_model.dart';
import 'package:frontend/models/clinic/clinic_country.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:frontend/services/api_service.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc()
      : super(SignUpState(
            birthDate: DateTime.now(),
            city: SimpleResponse(uuid: "", name: ""),
            country: SimpleResponse(uuid: "", name: ""),
            state: SimpleResponse(uuid: "", name: ""),
            message: MessageModel())) {
    on<SignUpLoad>(_onSignUpLoad);
    on<SignUpEdit>(_onSignUpEdit);
    on<SignUpValidate>(_onSignUpValidate);
    on<UpdateFields>(_updateFields);
    on<SignUpSubmit>(_onFormSubmitted);
    on<PreviousStep>(_onPreviousStep);
    on<NextStep>(_onNextStep);
    on<LoadCountries>(_loadCountries);
    on<LoadStates>(_loadStates);
    on<LoadCities>(_loadCities);
    on<UpdateCountry>(_updateCountry);
    on<UpdateState>(_updateState);
    on<UpdateCity>(_updateCity);
  }

  void _onSignUpLoad(SignUpLoad event, Emitter<SignUpState> emit) async {
    ClinicCountry country = await (await ApiService.create()).client.getCountry();
    emit(state.copyWith(clinicCountry: country.country, isLoadingClinicCountry: false));
    add(LoadCountries());
  }

  void _onSignUpEdit(SignUpEdit event, Emitter<SignUpState> emit) async {
    ClinicCountry country = await (await ApiService.create()).client.getCountry();
    PatientModel patient = await (await ApiService.create()).client.findById(event.patientUuid);
    emit(state.copyWith(
        patientUuid: patient.uuid,
        fullName: patient.fullName,
        email: patient.email,
        documentNumber: patient.documentNumber,
        gender: patient.gender,
        birthDate: patient.birthDate,
        phoneNumber: patient.phoneNumber,
        healthNumber: patient.healthNumber,
        occupation: patient.occupation,
        street: patient.address.street,
        number: patient.address.number,
        complement: patient.address.complement,
        neighborhood: patient.address.neighborhood,
        zipCode: patient.address.zipCode,
        city: patient.address.city,
        state: patient.address.state,
        country: patient.address.country,
        clinicCountry: country.country,
        isLoadingClinicCountry: false,
        step: 0));
    add(LoadCountries());
    add(LoadStates(country: state.country.uuid));
    add(LoadCities(state: state.state.uuid));
  }

  void _onSignUpValidate(SignUpValidate event, Emitter<SignUpState> emit) {
    emit(state.copyWith(formValidation: FormValidation.isValidating));
    emit(state.copyWith(formValidation: FormValidation.none));
  }

  void _onFormSubmitted(SignUpSubmit event, Emitter<SignUpState> emit) async {
    PatientModel patient = PatientModel(
        uuid: state.patientUuid,
        fullName: state.fullName,
        email: state.email,
        documentNumber: state.documentNumber,
        gender: state.gender,
        birthDate: state.birthDate,
        phoneNumber: state.phoneNumber,
        healthNumber: state.healthNumber,
        occupation: state.occupation,
        address: AddressModel(
          uuid: "",
          street: state.street,
          number: state.number,
          complement: state.complement,
          neighborhood: state.neighborhood,
          country: state.country,
          state: state.state,
          zipCode: state.zipCode,
          city: state.city,
        ));
    MessageModel message = await (await ApiService.create()).client.insertOrUpdateByClinic(patient);
    emit(state.copyWith(successSubmittingForm: true, message: message));
  }

  void _updateFields(UpdateFields event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      showPassword: event.showPassword,
      gender: event.gender,
      email: event.email,
      fullName: event.fullName,
      documentNumber: event.documentNumber,
      password: event.password,
      confirmPassword: event.confirmPassword,
      street: event.street,
      number: event.number,
      complement: event.complement,
      neighborhood: event.neighborhood,
      zipCode: event.zipCode,
      birthDate: event.birthDate,
      phoneNumber: event.phoneNumber,
      healthNumber: event.healthNumber,
      occupation: event.occupation,
    ));
  }

  void _onPreviousStep(PreviousStep event, Emitter<SignUpState> emit) {
    emit(state.copyWith(step: state.step - 1));
  }

  void _onNextStep(NextStep event, Emitter<SignUpState> emit) {
    emit(state.copyWith(step: state.step + 1));
  }

  void _loadCountries(LoadCountries event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoadingCountries: true));
    List<SimpleResponse> countries = await (await ApiService.create()).client.getCountries();
    emit(state.copyWith(countries: countries, states: [], cities: [], isLoadingCountries: false));
  }

  void _loadStates(LoadStates event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoadingStates: true));
    List<SimpleResponse> states = await (await ApiService.create()).client.getStates(state.country.uuid);
    emit(state.copyWith(states: states, cities: [], isLoadingStates: false));
  }

  void _loadCities(LoadCities event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoadingCities: true));
    List<SimpleResponse> cities = await (await ApiService.create()).client.getCities(state.state.uuid);
    emit(state.copyWith(cities: cities, isLoadingCities: false));
  }

  void _updateCountry(UpdateCountry event, Emitter<SignUpState> emit) {
    emit(state.copyWith(country: event.country));
    add(LoadStates(country: event.country.uuid));
  }

  void _updateState(UpdateState event, Emitter<SignUpState> emit) {
    emit(state.copyWith(state: event.state));
    add(LoadCities(state: event.state.uuid));
  }

  void _updateCity(UpdateCity event, Emitter<SignUpState> emit) {
    emit(state.copyWith(city: event.city));
  }
}
