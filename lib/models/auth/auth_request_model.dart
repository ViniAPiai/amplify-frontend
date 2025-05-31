
import 'package:json_annotation/json_annotation.dart';

part 'auth_request_model.g.dart';

@JsonSerializable()
class AuthRequestModel {

  late final String email;
  late final String password;

  AuthRequestModel({required this.email, required this.password});

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestModelToJson(this);


}