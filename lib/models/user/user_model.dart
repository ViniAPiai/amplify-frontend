import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {

  late String uuid;
  late String fullName;
  late String email;
  late String documentNumber;
  late DateTime createdAt;
  late DateTime updatedAt;
  late String roleName;

  UserModel(this.uuid, this.fullName, this.email, this.documentNumber, this.createdAt, this.updatedAt, this.roleName);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}