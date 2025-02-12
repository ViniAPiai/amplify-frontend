// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalHistoryModel _$MedicalHistoryModelFromJson(Map<String, dynamic> json) =>
    MedicalHistoryModel(
      json['uuid'] as String,
      json['hasDiabetes'] as bool,
      json['hasHypertension'] as bool,
      json['hasHeartProblems'] as bool,
      json['hasEpilepsy'] as bool,
      json['hasAsthma'] as bool,
      json['hasOsteoporosis'] as bool,
      json['allergies'] as String?,
      json['medications'] as String?,
      json['surgeries'] as String?,
      json['hasAnestheticAllergy'] as bool,
      json['hasBleedingIssues'] as bool,
      json['isPregnant'] as bool,
      (json['pregnancyMonth'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MedicalHistoryModelToJson(
        MedicalHistoryModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'hasDiabetes': instance.hasDiabetes,
      'hasHypertension': instance.hasHypertension,
      'hasHeartProblems': instance.hasHeartProblems,
      'hasEpilepsy': instance.hasEpilepsy,
      'hasAsthma': instance.hasAsthma,
      'hasOsteoporosis': instance.hasOsteoporosis,
      'allergies': instance.allergies,
      'medications': instance.medications,
      'surgeries': instance.surgeries,
      'hasAnestheticAllergy': instance.hasAnestheticAllergy,
      'hasBleedingIssues': instance.hasBleedingIssues,
      'isPregnant': instance.isPregnant,
      'pregnancyMonth': instance.pregnancyMonth,
    };
