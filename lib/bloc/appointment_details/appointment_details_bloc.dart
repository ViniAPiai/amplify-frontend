import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_event.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_state.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';
import 'package:frontend/services/api_service.dart';

class AppointmentDetailsBloc extends Bloc<AppointmentDetailsEvent, AppointmentDetailsState> {
  AppointmentDetailsBloc() : super(AppointmentDetailsState(appointment: AppointmentModel.empty())) {
    on<ChangeSelectedTabEvent>(_onChangeSelectedTab);
    on<LoadAppointmentDetailsEvent>(_onLoadAppointmentDetails);
    on<SubmitClinicalExamEvent>(_onSubmitClinicalExam);
    on<SubmitPatientArrivedEvent>(_onSubmitPatientArrived);
    on<UpdateHasCavitiesEvent>(_onUpdateHasCavities);
    on<UpdateHasToothWearEvent>(_onUpdateHasToothWear);
    on<UpdateHasFracturesEvent>(_onUpdateHasFractures);
    on<UpdateHasGumBleedingEvent>(_onUpdateHasGumBleeding);
    on<UpdateHasGumInflammationEvent>(_onUpdateHasGumInflammation);
    on<UpdateHasGumRecessionEvent>(_onUpdateHasGumRecession);
    on<UpdateOtherObservationsEvent>(_onUpdateOtherObservations);
  }

  void _onChangeSelectedTab(ChangeSelectedTabEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(selectedTab: event.index));
  }

  void _onLoadAppointmentDetails(LoadAppointmentDetailsEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: event.appointment));
  }

  void _onSubmitClinicalExam(SubmitClinicalExamEvent event, Emitter<AppointmentDetailsState> emit) async {
    ClinicalExamModel? clinicalExam =
        await (await ApiService.create(withAuth: true)).client.insertOrUpdateClinicalExam(state.appointment.clinicalExam!, state.appointment.uuid!);
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: clinicalExam), successSubmittingClinicalExam: true));
  }

  void _onSubmitPatientArrived(SubmitPatientArrivedEvent event, Emitter<AppointmentDetailsState> emit) async {
    AppointmentModel? appointment = await (await ApiService.create(withAuth: true)).client.patientArrivedAppointmentByClinic(state.appointment.uuid!);
    emit(state.copyWith(appointment: appointment, successSubmittingPatientArrived: true));
  }

  void _onUpdateHasCavities(UpdateHasCavitiesEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(hasCavities: event.value))));
  }

  void _onUpdateHasToothWear(UpdateHasToothWearEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(hasToothWear: event.value))));
  }

  void _onUpdateHasFractures(UpdateHasFracturesEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(hasFractures: event.value))));
  }

  void _onUpdateHasGumBleeding(UpdateHasGumBleedingEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(hasGumBleeding: event.value))));
  }

  void _onUpdateHasGumInflammation(UpdateHasGumInflammationEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(hasGumInflammation: event.value))));
  }

  void _onUpdateHasGumRecession(UpdateHasGumRecessionEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(hasGumRecession: event.value))));
  }

  void _onUpdateOtherObservations(UpdateOtherObservationsEvent event, Emitter<AppointmentDetailsState> emit) {
    emit(state.copyWith(appointment: state.appointment.copyWith(clinicalExam: state.appointment.clinicalExam!.copyWith(otherObservations: event.value))));
  }

}
