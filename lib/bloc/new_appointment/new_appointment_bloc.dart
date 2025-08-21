import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_event.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_state.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/dentist_free_time/dentist_free_time_response.dart';
import 'package:frontend/models/dentist_free_time_request.dart';
import 'package:frontend/models/page_request_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/services/api_service.dart';

class NewAppointmentBloc extends Bloc<NewAppointmentEvent, NewAppointmentState> {
  NewAppointmentBloc() : super(NewAppointmentState(model: AppointmentModel.empty())) {
    on<LoadNewAppointment>(_loadNewAppointment);
    on<UpdatePatient>(_updatePatient);
    on<UpdateDoctor>(_updateDoctor);
    on<UpdateNurse>(_updateNurse);
    on<UpdateAppointmentType>(_updateAppointmentType);
    on<UpdateDate>(_updateDate);
    on<UpdateNotes>(_updateNotes);
    on<AddTooth>(_addTooth);
    on<RemoveTooth>(_removeTooth);
    on<UpdateTimeRange>(_updateTimeRange);
    on<AddProcedureType>(_addProcedureType);
    on<RemoveProcedureType>(_removeProcedureType);
    on<FilterPatients>(_filterPatients);
    on<FilterProcedureTypes>(_filterProcedureTypes);
    on<FilterAppointmentTypes>(_filterAppointmentTypes);
    on<NextPage>(_nextPage);
    on<PreviousPage>(_previousPage);
    on<GetFreeTime>(_getFreeTime);
    on<SubmitNewAppointment>(_onSubmit);
  }

  void _loadNewAppointment(LoadNewAppointment event, Emitter<NewAppointmentState> emit) async {
    final api = await ApiService.create();
    final client = api.client;

    AppointmentModel model;
    if (event.uuid.isEmpty) {
      model = AppointmentModel.empty(date: event.date ?? DateTime.now());
    } else {
      model = await client.findAppointmentByUuid(event.uuid);
    }

    emit(state.copyWith(model: model));

    final results = await Future.wait([
      client.getAppointmentTypes(),
      client.getProcedureTypes(),
      client.dentistNames(),
      client.patientNames(PageRequestModel()),
      client.nurseNames(),
    ]);

    final appointmentTypes = results[0] as List<AppointmentTypeModel>;
    final procedureTypes = results[1] as List<ProcedureTypeModel>;
    final doctors = results[2] as List<UserModel>;
    final patients = results[3] as List<UserModel>;
    final nurses = results[4] as List<UserModel>;

    emit(state.copyWith(
      appointmentTypes: appointmentTypes,
      filteredAppointmentTypes: appointmentTypes,
      procedureTypes: procedureTypes,
      filteredProcedureTypes: procedureTypes,
      doctors: doctors,
      patients: patients,
      filteredPatients: patients,
      nurses: nurses,
      isLoadingAppointmentTypes: false,
      isLoadingProcedureTypes: false,
      isLoadingDoctors: false,
      isLoadingPatients: false,
      isLoadingNurses: false,
    ));
  }

  void _updatePatient(UpdatePatient event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(patient: PatientModel.fromUserModel(event.model))));
  }

  void _updateDoctor(UpdateDoctor event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(doctor: event.doctorModel)));
  }

  void _updateNurse(UpdateNurse event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(nurse: event.nurseModel)));
  }

  void _updateAppointmentType(UpdateAppointmentType event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(appointmentType: event.appointmentTypeModel)));
  }

  void _updateDate(UpdateDate event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(
        model: state.model.copyWith(date: event.date, startTime: TimeOfDay(hour: 0, minute: 0), endTime: TimeOfDay(hour: 0, minute: 0))));
    add(GetFreeTime());
  }

  void _updateNotes(UpdateNotes event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(notes: event.notes)));
  }

  void _addTooth(AddTooth event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(teeth: [...state.model.teeth!, event.tooth])));
  }

  void _removeTooth(RemoveTooth event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(teeth: state.model.teeth!.where((element) => element != event.tooth).toList())));
  }

  void _updateTimeRange(UpdateTimeRange event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(startTime: event.timeRange.startTime, endTime: event.timeRange.endTime)));
  }

  void _addProcedureType(AddProcedureType event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(model: state.model.copyWith(procedureTypes: [...state.model.procedureTypes!, event.procedureTypeModel])));
  }

  void _removeProcedureType(RemoveProcedureType event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(
        model: state.model.copyWith(procedureTypes: state.model.procedureTypes!.where((element) => element != event.procedureTypeModel).toList())));
  }

  void _filterPatients(FilterPatients event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(
        filteredPatients: state.patients.where((element) => element.fullName.toLowerCase().contains(event.searchTerm.toLowerCase())).toList()));
  }

  void _filterProcedureTypes(FilterProcedureTypes event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(
        filteredProcedureTypes:
            state.procedureTypes.where((element) => element.name.name.toLowerCase().contains(event.searchTerm.toLowerCase())).toList()));
  }

  void _filterAppointmentTypes(FilterAppointmentTypes event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(
        filteredAppointmentTypes:
            state.appointmentTypes.where((element) => element.name.name.toLowerCase().contains(event.searchTerm.toLowerCase())).toList()));
  }

  void _nextPage(NextPage event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(page: state.page + 1, progress: state.progress + 1 / 7, pageController: PageControllerValue.next));
    emit(state.copyWith(pageController: PageControllerValue.none));
    if(state.page == 5) {
      add(GetFreeTime());
    }
  }

  void _previousPage(PreviousPage event, Emitter<NewAppointmentState> emit) {
    emit(state.copyWith(page: state.page - 1, progress: state.progress - 1 / 7, pageController: PageControllerValue.previous));
    emit(state.copyWith(pageController: PageControllerValue.none));
  }

  void _getFreeTime(GetFreeTime event, Emitter<NewAppointmentState> emit) async {
    if (state.model.doctor!.uuid != null && state.model.doctor!.uuid!.isNotEmpty && state.model.procedureTypes!.isNotEmpty) {
      DentistFreeTimeResponse response = await (await ApiService.create()).client.freeTime(state.model.doctor!.uuid!,
          DentistFreeTimeRequest(date: state.model.date, procedureTypeUuids: state.model.procedureTypes!.map((e) => e.uuid).toList()));
      emit(state.copyWith(timeRanges: response.timeRanges, isLoadingFreeTime: false));
      print(state.timeRanges);
    }
  }

  void _onSubmit(SubmitNewAppointment event, Emitter<NewAppointmentState> emit) async {
    emit(state.copyWith(isRegistering: true));
    try {
      await (await ApiService.create()).client.insertAppointment(state.model.toJsonForInsert());
      emit(state.copyWith(isRegistering: false, success: true));
    } catch (e) {
      print(e);
      emit(state.copyWith(isRegistering: false));
    }
  }
}
