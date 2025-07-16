import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/bloc/side_bar/side_bar_state.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';
import 'package:frontend/services/api_service.dart';

class SideBarBloc extends Bloc<SideBarEvent, SideBarState> {
  SideBarBloc() : super(SideBarState(clinicalExam: ClinicalExamModel.empty(), appointment: AppointmentModel.empty())) {
    on<OpenSideBar>(_onOpenSideBar);
    on<CloseSideBar>(_onCloseSideBar);
    on<ToggleNewAppointmentModal>(_onToggleNewAppointmentModal);
    on<ToggleAppointmentDetailsModal>(_onToggleAppointmentDetailsModal);
    on<ToggleClinicalExamModal>(_onToggleClinicalExamModal);
    on<OpenEditAppointmentModal>(_onOpenEditAppointmentModal);
    on<ToggleNewPatientModal>(_onToggleNewPatientModal);
  }

  void _onOpenSideBar(OpenSideBar event, Emitter<SideBarState> emit) async {
    emit(state.copyWith(shouldOpenSideBar: true));
    await Future.delayed(Duration(milliseconds: 100));
    emit(state.copyWith(shouldOpenSideBar: false));
  }

  void _onCloseSideBar(CloseSideBar event, Emitter<SideBarState> emit) {
    emit(state.copyWith(shouldOpenSideBar: false));
  }

  void _onToggleNewAppointmentModal(ToggleNewAppointmentModal event, Emitter<SideBarState> emit) {
    final isOpening = !state.showNewAppointmentModal;

    emit(state.copyWith(
      showNewAppointmentModal: isOpening,
      showBarrier: isOpening,
      selectedDate: event.date ?? DateTime.now(),
      uuid: event.uuid,
    ));
  }

  Future<void> _onToggleAppointmentDetailsModal(ToggleAppointmentDetailsModal event, Emitter<SideBarState> emit) async {
    final isOpening = !state.showAppointmentDetailsModal;

    if (event.uuid.isNotEmpty && isOpening) {
      final client = (await ApiService.create(withAuth: true)).client;
      final appointment = await client.findAppointmentByUuid(event.uuid);
      emit(state.copyWith(
        appointment: appointment,
        showAppointmentDetailsModal: true,
        showBarrier: true,
      ));
    } else {
      emit(state.copyWith(
        showAppointmentDetailsModal: isOpening,
        showBarrier: isOpening,
      ));
    }
  }

  void _onToggleClinicalExamModal(ToggleClinicalExamModal event, Emitter<SideBarState> emit) {
    final isOpening = !state.showClinicalExamModal;
    emit(state.copyWith(
      showClinicalExamModal: isOpening,
      appointmentDetailsModalRightPosition: isOpening ? -350 : 16,
    ));
  }

  void _onOpenEditAppointmentModal(OpenEditAppointmentModal event, Emitter<SideBarState> emit) {
    final toggled = !state.showAppointmentDetailsModal;
    final uuid = event.uuid;
    emit(state.copyWith(
      showAppointmentDetailsModal: toggled,
      showBarrier: toggled,
      uuid: uuid,
    ));

    add(ToggleNewAppointmentModal(uuid: uuid));
  }

  void _onToggleNewPatientModal(ToggleNewPatientModal event, Emitter<SideBarState> emit) {
    final isOpening = !state.showNewPatientModal;
    emit(state.copyWith(
      showNewPatientModal: isOpening,
      showBarrier: isOpening,
      patientUuid: event.uuid,
    ));
  }
}
