
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/sign_up/sign_up_event.dart';
import 'package:frontend/bloc/sign_up/sign_up_state.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:frontend/services/api_service.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  SignUpBloc() : super(const SignUpState()) {
    on<UpdateFields>(_updateFields);
    on<SignUpSubmit>(_onFormSubmitted);
    on<LoadCountries>(_loadCountries);
    on<LoadStates>(_loadStates);
    on<LoadCities>(_loadCities);
    on<UpdateCountry>(_updateCountry);
    on<UpdateState>(_updateState);
    on<UpdateCity>(_updateCity);
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
      district: event.district,
      zipCode: event.zipCode,
      birthDate: event.birthDate,
      phoneNumber: event.phoneNumber,
      healthNumber: event.healthNumber,
      nationalRegistry: event.nationalRegistry,
      nationalRegistryExpirationDate: event.nationalRegistryExpirationDate,
      occupation: event.occupation,
    ));
  }

  void _onFormSubmitted(SignUpSubmit event, Emitter<SignUpState> emit) async {

  }

  void _loadCountries(LoadCountries event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoadingCountries: true));
    List<SimpleResponse> countries = await (await ApiService.create()).client.getCountries();
    emit(state.copyWith(countries: countries, states: [], cities: [], isLoadingCountries: false));
  }

  void _loadStates(LoadStates event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoadingStates: true));
    List<SimpleResponse> states = await (await ApiService.create()).client.getStates(state.country);
    emit(state.copyWith(states: states, cities: [], isLoadingStates: false));
  }

  void _loadCities(LoadCities event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoadingCities: true));
    List<SimpleResponse> cities = await (await ApiService.create()).client.getCities(state.state);
    emit(state.copyWith(cities: cities, isLoadingCities: false));
  }

  void _updateCountry(UpdateCountry event, Emitter<SignUpState> emit) {
    emit(state.copyWith(country: event.country));
    add(LoadStates(country: event.country));
  }

  void _updateState(UpdateState event, Emitter<SignUpState> emit) {
    emit(state.copyWith(state: event.state));
    add(LoadCities(state: event.state));
  }

  void _updateCity(UpdateCity event, Emitter<SignUpState> emit) {
    emit(state.copyWith(city: event.city));
  }

}