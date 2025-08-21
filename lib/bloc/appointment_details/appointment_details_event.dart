import 'package:equatable/equatable.dart';
import 'package:frontend/models/appointment/appointment_model.dart';

class AppointmentDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeSelectedTabEvent extends AppointmentDetailsEvent {
  final int index;

  ChangeSelectedTabEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class LoadAppointmentDetailsEvent extends AppointmentDetailsEvent {
  final AppointmentModel appointment;

  LoadAppointmentDetailsEvent({required this.appointment});

  @override
  List<Object?> get props => [appointment];
}

class SubmitClinicalExamEvent extends AppointmentDetailsEvent {}

class SubmitPatientArrivedEvent extends AppointmentDetailsEvent {}

class UpdateHasCavitiesEvent extends AppointmentDetailsEvent {
  final bool value;

  UpdateHasCavitiesEvent(this.value);
}

class UpdateHasToothWearEvent extends AppointmentDetailsEvent {
  final bool value;

  UpdateHasToothWearEvent(this.value);
}

class UpdateHasFracturesEvent extends AppointmentDetailsEvent {
  final bool value;

  UpdateHasFracturesEvent(this.value);
}

class UpdateHasGumBleedingEvent extends AppointmentDetailsEvent {
  final bool value;

  UpdateHasGumBleedingEvent(this.value);
}

class UpdateHasGumInflammationEvent extends AppointmentDetailsEvent {
  final bool value;

  UpdateHasGumInflammationEvent(this.value);
}

class UpdateHasGumRecessionEvent extends AppointmentDetailsEvent {
  final bool value;

  UpdateHasGumRecessionEvent(this.value);
}

class UpdateOtherObservationsEvent extends AppointmentDetailsEvent {
  final String value;

  UpdateOtherObservationsEvent(this.value);
}
