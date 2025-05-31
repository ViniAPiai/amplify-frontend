
import 'package:json_annotation/json_annotation.dart';

part 'page_request_model.g.dart';

@JsonSerializable()
class PageRequestModel {

  final String searchTerm;
  final int? page;

  PageRequestModel({this.searchTerm = "", this.page});

  factory PageRequestModel.fromJson(Map<String, dynamic> json) => _$PageRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageRequestModelToJson(this);

}