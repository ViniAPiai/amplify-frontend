import 'package:equatable/equatable.dart';
import 'package:frontend/models/appointment/appointment_model.dart';

class AppointmentDetailsState extends Equatable {
  final AppointmentModel appointment;
  final int selectedTab;
  final bool successSubmittingClinicalExam;
  final bool successSubmittingPatientArrived;
  final String? error;

  const AppointmentDetailsState(
      {required this.appointment,
      this.selectedTab = 0,
      this.error,
      this.successSubmittingClinicalExam = false,
      this.successSubmittingPatientArrived = false});

  AppointmentDetailsState copyWith(
      {AppointmentModel? appointment, int? selectedTab, String? error, bool? successSubmittingClinicalExam, bool? successSubmittingPatientArrived}) {
    return AppointmentDetailsState(
      appointment: appointment ?? this.appointment,
      selectedTab: selectedTab ?? this.selectedTab,
      error: error,
      successSubmittingClinicalExam: successSubmittingClinicalExam ?? this.successSubmittingClinicalExam,
      successSubmittingPatientArrived: successSubmittingPatientArrived ?? this.successSubmittingPatientArrived,
    );
  }

  @override
  List<Object?> get props => [appointment, selectedTab];
}
