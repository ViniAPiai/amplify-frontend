

import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {

  String token;
  DateTime expiresIn;

  AuthResponseModel(this.token, this.expiresIn);

}