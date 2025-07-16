// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponseModel<T> _$PageResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageResponseModel<T>(
      content: (json['content'] as List<dynamic>?)?.map(fromJsonT).toList() ??
          const [],
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PageResponseModelToJson<T>(
  PageResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'content': instance.content.map(toJsonT).toList(),
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
