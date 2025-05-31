
import 'package:json_annotation/json_annotation.dart';

part 'page_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageResponseModel<T> {

  late List<T> content;
  late int totalPages;
  late int totalItems;

  PageResponseModel({required this.content, required this.totalPages, required this.totalItems});

  factory PageResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$PageResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$PageResponseModelToJson(this, toJsonT);

}