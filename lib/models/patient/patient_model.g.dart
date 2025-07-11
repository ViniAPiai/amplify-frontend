// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      gender: json['gender'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      phoneNumber: json['phoneNumber'] as String,
      healthNumber: json['healthNumber'] as String,
      nationalRegistry: json['nationalRegistry'] as String,
      nationalRegistryExpirationDate: json['nationalRegistryExpirationDate'] ==
              null
          ? null
          : DateTime.parse(json['nationalRegistryExpirationDate'] as String),
      occupation: json['occupation'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      uuid: json['uuid'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      documentNumber: json['documentNumber'] as String?,
    )
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..roleName = json['roleName'] as String?
      ..languageCode = json['languageCode'] as String?;

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'fullName': instance.fullName,
      'email': instance.email,
      'documentNumber': instance.documentNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'roleName': instance.roleName,
      'languageCode': instance.languageCode,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'healthNumber': instance.healthNumber,
      'nationalRegistry': instance.nationalRegistry,
      'nationalRegistryExpirationDate':
          instance.nationalRegistryExpirationDate?.toIso8601String(),
      'occupation': instance.occupation,
      'address': instance.address,
    };
