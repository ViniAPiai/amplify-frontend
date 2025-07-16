import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/patient/patient_event.dart';
import 'package:frontend/bloc/patient/patient_state.dart';
import 'package:frontend/models/page_request_model.dart';
import 'package:frontend/models/page_response_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/services/api_service.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(PatientState(patients: PageResponseModel())) {
    on<UpdateSearchTermEvent>(_onUpdatedSearchTerm);
    on<PatientSearchEvent>(_onSearch);
    on<PatientLoadEvent>(_onLoadPatients);
    on<ChangePageEvent>(_onChangePage);
  }

  void _onLoadPatients(PatientEvent event, Emitter<PatientState> emit) async {
    emit(state.copyWith(isLoading: true));
    PageResponseModel<PatientModel> patients = await (await ApiService.create())
        .client
        .patientSecretaryPagination(PageRequestModel(searchTerm: state.searchTerm, page: state.selectedPage - 1));
    emit(state.copyWith(patients: patients, isLoading: false));
  }

  void _onChangePage(ChangePageEvent event, Emitter<PatientState> emit) async {
    emit(state.copyWith(isLoading: true));
    PageResponseModel<PatientModel> patients = await (await ApiService.create())
        .client
        .patientSecretaryPagination(PageRequestModel(searchTerm: state.searchTerm, page: event.selectedPage - 1));
    emit(state.copyWith(selectedPage: event.selectedPage, patients: patients, isLoading: false));
  }

  void _onSearch(PatientSearchEvent event, Emitter<PatientState> emit) async {
    emit(state.copyWith(selectedPage: 1, isLoading: true));
    PageResponseModel<PatientModel> patients = await (await ApiService.create())
        .client
        .patientSecretaryPagination(PageRequestModel(searchTerm: state.searchTerm, page: state.selectedPage - 1));
    emit(state.copyWith(patients: patients, isLoading: false));
  }

  void _onUpdatedSearchTerm(UpdateSearchTermEvent event, Emitter<PatientState> emit) {
    emit(state.copyWith(searchTerm: event.searchTerm));
  }
}
