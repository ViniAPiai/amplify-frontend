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
          : PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : UserModel.fromJson(json['doctor'] as Map<String, dynamic>),
      nurse: json['nurse'] == null
          ? null
          : UserModel.fromJson(json['nurse'] as Map<String, dynamic>),
      procedureTypes: AppointmentModel._procedureTypeFromJson(
          json['procedureTypes'] as List?),
      teeth: (json['teeth'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ToothCodeEnumMap, e))
          .toList(),
      clinicalExam: AppointmentModel._clinicalExamFromJson(
          json['clinicalExam'] as Map<String, dynamic>?),
    )..message = json['message'] as String?;

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
  AppointmentStatusEnum.arrived: 'ARRIVED',
  AppointmentStatusEnum.inProgress: 'IN_PROGRESS',
  AppointmentStatusEnum.finished: 'FINISHED',
  AppointmentStatusEnum.cancelled: 'CANCELLED',
};

const _$ToothCodeEnumMap = {
  ToothCode.T_11: 'T_11',
  ToothCode.T_12: 'T_12',
  ToothCode.T_13: 'T_13',
  ToothCode.T_14: 'T_14',
  ToothCode.T_15: 'T_15',
  ToothCode.T_16: 'T_16',
  ToothCode.T_17: 'T_17',
  ToothCode.T_18: 'T_18',
  ToothCode.T_21: 'T_21',
  ToothCode.T_22: 'T_22',
  ToothCode.T_23: 'T_23',
  ToothCode.T_24: 'T_24',
  ToothCode.T_25: 'T_25',
  ToothCode.T_26: 'T_26',
  ToothCode.T_27: 'T_27',
  ToothCode.T_28: 'T_28',
  ToothCode.T_31: 'T_31',
  ToothCode.T_32: 'T_32',
  ToothCode.T_33: 'T_33',
  ToothCode.T_34: 'T_34',
  ToothCode.T_35: 'T_35',
  ToothCode.T_36: 'T_36',
  ToothCode.T_37: 'T_37',
  ToothCode.T_38: 'T_38',
  ToothCode.T_41: 'T_41',
  ToothCode.T_42: 'T_42',
  ToothCode.T_43: 'T_43',
  ToothCode.T_44: 'T_44',
  ToothCode.T_45: 'T_45',
  ToothCode.T_46: 'T_46',
  ToothCode.T_47: 'T_47',
  ToothCode.T_48: 'T_48',
  ToothCode.T_51: 'T_51',
  ToothCode.T_52: 'T_52',
  ToothCode.T_53: 'T_53',
  ToothCode.T_54: 'T_54',
  ToothCode.T_55: 'T_55',
  ToothCode.T_61: 'T_61',
  ToothCode.T_62: 'T_62',
  ToothCode.T_63: 'T_63',
  ToothCode.T_64: 'T_64',
  ToothCode.T_65: 'T_65',
  ToothCode.T_71: 'T_71',
  ToothCode.T_72: 'T_72',
  ToothCode.T_73: 'T_73',
  ToothCode.T_74: 'T_74',
  ToothCode.T_75: 'T_75',
  ToothCode.T_81: 'T_81',
  ToothCode.T_82: 'T_82',
  ToothCode.T_83: 'T_83',
  ToothCode.T_84: 'T_84',
  ToothCode.T_85: 'T_85',
};
