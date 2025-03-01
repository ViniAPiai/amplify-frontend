// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_patient_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagePatientResponseModel _$PagePatientResponseModelFromJson(
        Map<String, dynamic> json) =>
    PagePatientResponseModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => PatientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
    )..totalItems = (json['totalItems'] as num).toInt();

Map<String, dynamic> _$PagePatientResponseModelToJson(
        PagePatientResponseModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
