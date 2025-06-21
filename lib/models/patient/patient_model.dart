import 'package:frontend/models/address/address_model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel extends UserModel {
  late String gender;
  late DateTime birthDate;
  late String phoneNumber;
  late String healthNumber;
  late String nationalRegistry;
  late DateTime? nationalRegistryExpirationDate;
  late String occupation;
  late AddressModel address;

  PatientModel({required this.gender, required this.birthDate, required this.phoneNumber, required this.healthNumber, required this.nationalRegistry,
    this.nationalRegistryExpirationDate, required this.occupation, required this.address,
    required super.uuid, required super.fullName, required super.email, required super.documentNumber});

  factory PatientModel.empty() {
    return PatientModel(
      uuid: "",
      fullName: "",
      email: "",
      documentNumber: "",
      gender: "",
      birthDate: DateTime.now(),
      phoneNumber: "",
      healthNumber: "",
      nationalRegistry: "",
      nationalRegistryExpirationDate: DateTime.now(),
      occupation: '',
      address: AddressModel.empty(),
    );
  }

  factory PatientModel.fromUserModel(UserModel model) {
    return PatientModel(
      uuid: model.uuid,
      fullName: model.fullName,
      email: '',
      documentNumber: '',
      gender: "",
      birthDate: DateTime.now(),
      phoneNumber: "",
      healthNumber: "",
      nationalRegistry: "",
      nationalRegistryExpirationDate: DateTime.now(),
      occupation: '',
      address: AddressModel.empty(),
    );
  }

  factory PatientModel.fromJson(Map<String, dynamic> json) => _$PatientModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PatientModelToJson(this);


}
