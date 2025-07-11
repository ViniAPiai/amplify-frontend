// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_type.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcedureTypeModel _$ProcedureTypeModelFromJson(Map<String, dynamic> json) =>
    ProcedureTypeModel(
      json['uuid'] as String,
      $enumDecode(_$ProcedureTypeEnumEnumMap, json['name']),
      (json['basePrice'] as num).toDouble(),
      (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$ProcedureTypeModelToJson(ProcedureTypeModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': _$ProcedureTypeEnumEnumMap[instance.name]!,
      'basePrice': instance.basePrice,
      'time': instance.time,
    };

const _$ProcedureTypeEnumEnumMap = {
  ProcedureTypeEnum.cleaning: 'cleaning',
  ProcedureTypeEnum.extraction: 'extraction',
  ProcedureTypeEnum.filling: 'filling',
  ProcedureTypeEnum.rootCanal: 'rootCanal',
  ProcedureTypeEnum.whitening: 'whitening',
  ProcedureTypeEnum.crownPlacement: 'crownPlacement',
  ProcedureTypeEnum.implant: 'implant',
  ProcedureTypeEnum.bracesInstall: 'bracesInstall',
  ProcedureTypeEnum.oralSurgery: 'oralSurgery',
  ProcedureTypeEnum.aestheticProcedure: 'aestheticProcedure',
  ProcedureTypeEnum.scaling: 'scaling',
  ProcedureTypeEnum.xray: 'xray',
  ProcedureTypeEnum.dentureFitting: 'dentureFitting',
  ProcedureTypeEnum.fluorideTreatment: 'fluorideTreatment',
  ProcedureTypeEnum.gumSurgery: 'gumSurgery',
  ProcedureTypeEnum.temporomandibularTx: 'temporomandibularTx',
  ProcedureTypeEnum.pediatricTreatment: 'pediatricTreatment',
  ProcedureTypeEnum.traumaCare: 'traumaCare',
  ProcedureTypeEnum.occlusionCorrection: 'occlusionCorrection',
};
