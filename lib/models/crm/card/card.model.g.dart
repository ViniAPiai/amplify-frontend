// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      uuid: json['uuid'] as String,
      index: (json['index'] as num).toInt(),
      title: json['title'] as String,
      type: $enumDecode(_$CardTypeEnumEnumMap, json['type']),
      extraData: json['extraData'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'index': instance.index,
      'title': instance.title,
      'type': _$CardTypeEnumEnumMap[instance.type]!,
      'extraData': instance.extraData,
    };

const _$CardTypeEnumEnumMap = {
  CardTypeEnum.defaultType: 'DEFAULT_TYPE',
  CardTypeEnum.patientType: 'PATIENT_TYPE',
  CardTypeEnum.getInTouchType: 'GET_IN_TOUCH_TYPE',
};
