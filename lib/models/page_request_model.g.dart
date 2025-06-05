// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageRequestModel _$PageRequestModelFromJson(Map<String, dynamic> json) =>
    PageRequestModel(
      searchTerm: json['searchTerm'] as String? ?? "",
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PageRequestModelToJson(PageRequestModel instance) =>
    <String, dynamic>{
      'searchTerm': instance.searchTerm,
      'page': instance.page,
    };
