
import 'package:equatable/equatable.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';

class SideBarState extends Equatable {
  final bool shouldOpenSideBar;
  final bool showBarrier;
  final bool showNewAppointmentModal;
  final bool showAppointmentDetailsModal;
  final bool showClinicalExamModal;
  final bool showNewCardModal;
  final String columnUuid;
  final bool showNewPatientModal;
  final String patientUuid;
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
    this.showNewCardModal = false,
    this.columnUuid = '',
    this.showNewPatientModal = false,
    this.patientUuid = '',
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
    bool? showNewCardModal,
    String? columnUuid,
    bool? showNewPatientModal,
    String? patientUuid,
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
      showNewCardModal: showNewCardModal ?? this.showNewCardModal,
      columnUuid: columnUuid ?? this.columnUuid,
      showNewPatientModal: showNewPatientModal ?? this.showNewPatientModal,
      patientUuid: patientUuid ?? this.patientUuid,
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
    showNewCardModal,
    columnUuid,
    showNewPatientModal,
    patientUuid,
    selectedDate,
    uuid,
    appointment,
    clinicalExam,
    appointmentDetailsModalRightPosition,
  ];
}
