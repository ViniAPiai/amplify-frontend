// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_exam.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicalExamModel _$ClinicalExamModelFromJson(Map<String, dynamic> json) =>
    ClinicalExamModel(
      uuid: json['uuid'] as String,
      hasCavities: json['hasCavities'] as bool,
      hasToothWear: json['hasToothWear'] as bool,
      hasFractures: json['hasFractures'] as bool,
      hasGumBleeding: json['hasGumBleeding'] as bool,
      hasGumInflammation: json['hasGumInflammation'] as bool,
      hasGumRecession: json['hasGumRecession'] as bool,
      otherObservations: json['otherObservations'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ClinicalExamModelToJson(ClinicalExamModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'hasCavities': instance.hasCavities,
      'hasToothWear': instance.hasToothWear,
      'hasFractures': instance.hasFractures,
      'hasGumBleeding': instance.hasGumBleeding,
      'hasGumInflammation': instance.hasGumInflammation,
      'hasGumRecession': instance.hasGumRecession,
      'otherObservations': instance.otherObservations,
      'message': instance.message,
    };
