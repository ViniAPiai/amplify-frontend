
import 'package:json_annotation/json_annotation.dart';

part 'simple_response.g.dart';

@JsonSerializable()
class SimpleResponse {

  final String uuid;
  final String name;

  SimpleResponse({required this.uuid, required this.name});

  factory SimpleResponse.fromJson(Map<String, dynamic> json) => _$SimpleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleResponseToJson(this);

  @override
  String toString() {
    return 'SimpleResponse(uuid: $uuid, name: $name)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SimpleResponse && runtimeType == other.runtimeType && uuid == other.uuid && name == other.name;

  @override
  int get hashCode => uuid.hashCode ^ name.hashCode;
}