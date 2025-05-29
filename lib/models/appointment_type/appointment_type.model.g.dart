// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_type.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentTypeModel _$AppointmentTypeModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentTypeModel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AppointmentTypeModelToJson(
        AppointmentTypeModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
    };
