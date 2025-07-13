
import 'package:equatable/equatable.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';

class SideBarState extends Equatable {
  final bool shouldOpenSideBar;
  final bool showBarrier;
  final bool showNewAppointmentModal;
  final bool showAppointmentDetailsModal;
  final bool showClinicalExamModal;
  final DateTime? selectedDate;
  final String uuid;
  final AppointmentModel appointment;
  final ClinicalExamModel clinicalExam;
  final double appointmentDetailsModalRightPosition;

  const SideBarState({
    this.shouldOpenSideBar = false,
    this.showBarrier = false,
    this.showNewAppointmentModal = false,
    this.showAppointmentDetailsModal = false,
    this.showClinicalExamModal = false,
    this.selectedDate,
    this.uuid = '',
    required this.appointment,
    required this.clinicalExam,
    this.appointmentDetailsModalRightPosition = 16,
  });

  SideBarState copyWith({
    bool? shouldOpenSideBar,
    bool? showBarrier,
    bool? showNewAppointmentModal,
    bool? showAppointmentDetailsModal,
    bool? showClinicalExamModal,
    DateTime? selectedDate,
    String? uuid,
    AppointmentModel? appointment,
    ClinicalExamModel? clinicalExam,
    double? appointmentDetailsModalRightPosition,
  }) {
    return SideBarState(
      shouldOpenSideBar: shouldOpenSideBar ?? this.shouldOpenSideBar,
      showBarrier: showBarrier ?? this.showBarrier,
      showNewAppointmentModal: showNewAppointmentModal ?? this.showNewAppointmentModal,
      showAppointmentDetailsModal: showAppointmentDetailsModal ?? this.showAppointmentDetailsModal,
      showClinicalExamModal: showClinicalExamModal ?? this.showClinicalExamModal,
      selectedDate: selectedDate ?? this.selectedDate,
      uuid: uuid ?? this.uuid,
      appointment: appointment ?? this.appointment,
      clinicalExam: clinicalExam ?? this.clinicalExam,
      appointmentDetailsModalRightPosition: appointmentDetailsModalRightPosition ?? this.appointmentDetailsModalRightPosition,
    );
  }

  @override
  List<Object?> get props => [
    shouldOpenSideBar,
    showBarrier,
    showNewAppointmentModal,
    showAppointmentDetailsModal,
    showClinicalExamModal,
    selectedDate,
    uuid,
    appointment,
    clinicalExam,
    appointmentDetailsModalRightPosition,
  ];
}
