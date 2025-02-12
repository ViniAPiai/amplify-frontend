// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      json['gender'] as String,
      DateTime.parse(json['birthDate'] as String),
      json['phoneNumber'] as String,
      json['healthNumber'] as String,
      json['nationalRegistry'] as String,
      DateTime.parse(json['nationalRegistryExpirationDate'] as String),
      json['occupation'] as String,
      json['uuid'] as String,
      json['fullName'] as String,
      json['email'] as String,
      json['documentNumber'] as String,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      json['roleName'] as String,
    )..address = AddressModel.fromJson(json['address'] as Map<String, dynamic>);

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'fullName': instance.fullName,
      'email': instance.email,
      'documentNumber': instance.documentNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'roleName': instance.roleName,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'healthNumber': instance.healthNumber,
      'nationalRegistry': instance.nationalRegistry,
      'nationalRegistryExpirationDate':
          instance.nationalRegistryExpirationDate.toIso8601String(),
      'occupation': instance.occupation,
      'address': instance.address.toJson(),
    };
