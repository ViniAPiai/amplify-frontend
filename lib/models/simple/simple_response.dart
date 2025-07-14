
import 'package:json_annotation/json_annotation.dart';

part 'simple_response.g.dart';

@JsonSerializable()
class SimpleResponse {

  final String uuid;
  final String name;

  SimpleResponse({required this.uuid, required this.name});

  factory SimpleResponse.fromJson(Map<String, dynamic> json) => _$SimpleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleResponseToJson(this);

}