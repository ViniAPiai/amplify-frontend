import 'package:equatable/equatable.dart';
import 'package:frontend/enums/tooth_code.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/dentist_free_time/time_range.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';

abstract class NewAppointmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdatePatient extends NewAppointmentEvent {
  final UserModel model;

  UpdatePatient({required this.model});
}

class UpdateDoctor extends NewAppointmentEvent {
  final UserModel doctorModel;

  UpdateDoctor({required this.doctorModel});
}

class UpdateNurse extends NewAppointmentEvent {
  final UserModel nurseModel;

  UpdateNurse({required this.nurseModel});
}

class UpdateAppointmentType extends NewAppointmentEvent {
  final AppointmentTypeModel appointmentTypeModel;

  UpdateAppointmentType({required this.appointmentTypeModel});
}

class UpdateDate extends NewAppointmentEvent {
  final DateTime date;

  UpdateDate(this.date);
}

class AddTooth extends NewAppointmentEvent {
  final ToothCode tooth;

  AddTooth(this.tooth);
}

class RemoveTooth extends NewAppointmentEvent {
  final ToothCode tooth;

  RemoveTooth(this.tooth);
}

class UpdateTimeRange extends NewAppointmentEvent {
  final TimeRange timeRange;

  UpdateTimeRange(this.timeRange);
}

class UpdateNotes extends NewAppointmentEvent {
  final String notes;
  UpdateNotes(this.notes);

  @override
  List<Object?> get props => [notes];
}

class AddProcedureType extends NewAppointmentEvent {
  final ProcedureTypeModel procedureTypeModel;

  AddProcedureType({required this.procedureTypeModel});
}

class RemoveProcedureType extends NewAppointmentEvent {
  final ProcedureTypeModel procedureTypeModel;

  RemoveProcedureType({required this.procedureTypeModel});
}

class LoadNewAppointment extends NewAppointmentEvent {
  final DateTime? date;
  final String uuid;

  LoadNewAppointment({this.date, this.uuid = ''});
}

class NextPage extends NewAppointmentEvent {}

class PreviousPage extends NewAppointmentEvent {}

class FilterPatients extends NewAppointmentEvent {
  final String searchTerm;

  FilterPatients({required this.searchTerm});
}

class FilterProcedureTypes extends NewAppointmentEvent {
  final String searchTerm;

  FilterProcedureTypes({required this.searchTerm});
}

class FilterAppointmentTypes extends NewAppointmentEvent {
  final String searchTerm;

  FilterAppointmentTypes({required this.searchTerm});
}

class GetFreeTime extends NewAppointmentEvent {}

class SubmitNewAppointment extends NewAppointmentEvent {}
