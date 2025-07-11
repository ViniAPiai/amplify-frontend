// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_type.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentTypeModel _$AppointmentTypeModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentTypeModel(
      uuid: json['uuid'] as String,
      name: $enumDecode(_$AppointmentTypeEnumEnumMap, json['name']),
    );

Map<String, dynamic> _$AppointmentTypeModelToJson(
        AppointmentTypeModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': _$AppointmentTypeEnumEnumMap[instance.name]!,
    };

const _$AppointmentTypeEnumEnumMap = {
  AppointmentTypeEnum.generalConsult: 'generalConsult',
  AppointmentTypeEnum.routineCheckup: 'routineCheckup',
  AppointmentTypeEnum.emergency: 'emergency',
  AppointmentTypeEnum.followUp: 'followUp',
  AppointmentTypeEnum.evaluation: 'evaluation',
  AppointmentTypeEnum.treatment: 'treatment',
  AppointmentTypeEnum.procedure: 'procedure',
  AppointmentTypeEnum.teleconsultation: 'teleconsultation',
  AppointmentTypeEnum.preSurgeryConsult: 'preSurgeryConsult',
  AppointmentTypeEnum.postSurgeryCheck: 'postSurgeryCheck',
  AppointmentTypeEnum.pediatricCheckup: 'pediatricCheckup',
  AppointmentTypeEnum.secondOpinion: 'secondOpinion',
};
