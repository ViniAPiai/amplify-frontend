// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dentist_free_time_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DentistFreeTimeRequest _$DentistFreeTimeRequestFromJson(
        Map<String, dynamic> json) =>
    DentistFreeTimeRequest(
      date: DateTime.parse(json['date'] as String),
      procedureTypeUuids: (json['procedureTypeUuids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DentistFreeTimeRequestToJson(
        DentistFreeTimeRequest instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'procedureTypeUuids': instance.procedureTypeUuids,
    };
