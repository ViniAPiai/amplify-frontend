import 'package:frontend/models/address/address_model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PatientModel extends UserModel {
  late String gender;
  late DateTime birthDate;
  late String phoneNumber;
  late String healthNumber;
  late String nationalRegistry;
  late DateTime nationalRegistryExpirationDate;
  late String occupation;
  late AddressModel address;

  PatientModel(this.gender, this.birthDate, this.phoneNumber, this.healthNumber, this.nationalRegistry, this.nationalRegistryExpirationDate,
      this.occupation, String uuid, String fullName, String email, String documentNumber, DateTime createdAt, DateTime updatedAt, String roleName)
      : super(uuid, fullName, email, documentNumber, createdAt, updatedAt, roleName);

  factory PatientModel.fromJson(Map<String, dynamic> json) => _$PatientModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PatientModelToJson(this);


}
