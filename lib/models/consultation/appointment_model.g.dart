// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      uuid: json['uuid'] as String?,
      notes: json['notes'] as String?,
      date: DateTime.parse(json['date'] as String),
      startTime:
          AppointmentModel._timeOfDayFromDateTime(json['startTime'] as String),
      endTime:
          AppointmentModel._timeOfDayFromDateTime(json['endTime'] as String),
      appointmentType: json['appointmentType'] == null
          ? null
          : AppointmentTypeModel.fromJson(
              json['appointmentType'] as Map<String, dynamic>),
      status:
          $enumDecodeNullable(_$AppointmentStatusEnumEnumMap, json['status']),
      patient: json['patient'] == null
          ? null
          : UserModel.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : UserModel.fromJson(json['doctor'] as Map<String, dynamic>),
      nurse: json['nurse'] == null
          ? null
          : UserModel.fromJson(json['nurse'] as Map<String, dynamic>),
      procedureTypes: AppointmentModel._procedureTypeFromJson(
          json['procedureTypes'] as List<Map<String, dynamic>>?),
      message: json['message'] as String?,
      teeth: AppointmentModel._fromJsonTeeth(json['teeth']),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'notes': instance.notes,
      'date': instance.date.toIso8601String(),
      'startTime': AppointmentModel._timeOfDayToString(instance.startTime),
      'endTime': AppointmentModel._timeOfDayToString(instance.endTime),
      'status': _$AppointmentStatusEnumEnumMap[instance.status],
      'patient': AppointmentModel._userToUuid(instance.patient),
      'doctor': AppointmentModel._userToUuid(instance.doctor),
      'nurse': AppointmentModel._userToUuid(instance.nurse),
      'appointmentType':
          AppointmentModel._appointmentTypeToUuid(instance.appointmentType),
      'procedureTypes':
          AppointmentModel._procedureTypeToUuidList(instance.procedureTypes),
      'teeth': instance.teeth?.map((e) => _$ToothCodeEnumMap[e]!).toList(),
    };

const _$AppointmentStatusEnumEnumMap = {
  AppointmentStatusEnum.waitingForClinicConfirmation:
      'WAITING_FOR_CLINIC_CONFIRMATION',
  AppointmentStatusEnum.scheduled: 'SCHEDULED',
  AppointmentStatusEnum.patientInTheClinic: 'PATIENT_IN_THE_CLINIC',
  AppointmentStatusEnum.finished: 'FINISHED',
  AppointmentStatusEnum.cancelled: 'CANCELLED',
};

const _$ToothCodeEnumMap = {
  ToothCode.t_11: 't_11',
  ToothCode.t_12: 't_12',
  ToothCode.t_13: 't_13',
  ToothCode.t_14: 't_14',
  ToothCode.t_15: 't_15',
  ToothCode.t_16: 't_16',
  ToothCode.t_17: 't_17',
  ToothCode.t_18: 't_18',
  ToothCode.t_21: 't_21',
  ToothCode.t_22: 't_22',
  ToothCode.t_23: 't_23',
  ToothCode.t_24: 't_24',
  ToothCode.t_25: 't_25',
  ToothCode.t_26: 't_26',
  ToothCode.t_27: 't_27',
  ToothCode.t_28: 't_28',
  ToothCode.t_31: 't_31',
  ToothCode.t_32: 't_32',
  ToothCode.t_33: 't_33',
  ToothCode.t_34: 't_34',
  ToothCode.t_35: 't_35',
  ToothCode.t_36: 't_36',
  ToothCode.t_37: 't_37',
  ToothCode.t_38: 't_38',
  ToothCode.t_41: 't_41',
  ToothCode.t_42: 't_42',
  ToothCode.t_43: 't_43',
  ToothCode.t_44: 't_44',
  ToothCode.t_45: 't_45',
  ToothCode.t_46: 't_46',
  ToothCode.t_47: 't_47',
  ToothCode.t_48: 't_48',
};
