import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {

  late final int id;
  late final String fullName;
  late final String email;
  late final DateTime createdAt;
  late final DateTime updatedAt;
  late final String roleName;

  UserModel(this.id, this.fullName, this.email, this.createdAt, this.updatedAt,
      this.roleName);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}