// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationModel _$ConsultationModelFromJson(Map<String, dynamic> json) =>
    ConsultationModel(
      uuid: json['uuid'] as String?,
      description: json['description'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      status:
          $enumDecodeNullable(_$ConsultationStatusEnumEnumMap, json['status']),
      patient: json['patient'] == null
          ? null
          : UserModel.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : UserModel.fromJson(json['doctor'] as Map<String, dynamic>),
      nurse: json['nurse'] == null
          ? null
          : UserModel.fromJson(json['nurse'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ConsultationModelToJson(ConsultationModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'status': _$ConsultationStatusEnumEnumMap[instance.status],
      'patient': instance.patient,
      'doctor': instance.doctor,
      'nurse': instance.nurse,
      'message': instance.message,
    };

const _$ConsultationStatusEnumEnumMap = {
  ConsultationStatusEnum.waitingForClinicConfirmation:
      'WAITING_FOR_CLINIC_CONFIRMATION',
  ConsultationStatusEnum.scheduled: 'SCHEDULED',
  ConsultationStatusEnum.patientInTheClinic: 'PATIENT_IN_THE_CLINIC',
  ConsultationStatusEnum.finished: 'FINISHED',
  ConsultationStatusEnum.cancelled: 'CANCELLED',
};
