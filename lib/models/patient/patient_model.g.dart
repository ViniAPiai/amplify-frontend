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
      if (instance.uuid case final value?) 'uuid': value,
      'fullName': instance.fullName,
      if (instance.email case final value?) 'email': value,
      if (instance.documentNumber case final value?) 'documentNumber': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      if (instance.roleName case final value?) 'roleName': value,
      if (instance.languageCode case final value?) 'languageCode': value,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'healthNumber': instance.healthNumber,
      'nationalRegistry': instance.nationalRegistry,
      if (instance.nationalRegistryExpirationDate?.toIso8601String()
          case final value?)
        'nationalRegistryExpirationDate': value,
      'occupation': instance.occupation,
      'address': instance.address,
    };
