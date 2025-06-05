// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaRequestModel _$AgendaRequestModelFromJson(Map<String, dynamic> json) =>
    AgendaRequestModel(
      interval: $enumDecode(_$AppointmentIntervalEnumEnumMap, json['interval']),
      day: DateTime.parse(json['day'] as String),
    );

Map<String, dynamic> _$AgendaRequestModelToJson(AgendaRequestModel instance) =>
    <String, dynamic>{
      'interval': AgendaRequestModel.intervalToJson(instance.interval),
      'day': instance.day.toIso8601String(),
    };

const _$AppointmentIntervalEnumEnumMap = {
  AppointmentIntervalEnum.daily: 'daily',
  AppointmentIntervalEnum.weekly: 'weekly',
  AppointmentIntervalEnum.monthly: 'monthly',
};
