// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'columns.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColumnsModel _$ColumnsModelFromJson(Map<String, dynamic> json) => ColumnsModel(
      uuid: json['uuid'] as String,
      index: (json['index'] as num).toInt(),
      name: json['name'] as String,
      cards: ColumnsModel._cardFromJson(json['cards'] as List),
    );

Map<String, dynamic> _$ColumnsModelToJson(ColumnsModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'index': instance.index,
      'name': instance.name,
      'cards': instance.cards,
    };
