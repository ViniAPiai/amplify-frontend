// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      uuid: json['uuid'] as String?,
      street: json['street'] as String,
      number: json['number'] as String,
      neighborhood: json['neighborhood'] as String,
      zipCode: json['zipCode'] as String,
      complement: json['complement'] as String,
      city: SimpleResponse.fromJson(json['city'] as Map<String, dynamic>),
      state: SimpleResponse.fromJson(json['state'] as Map<String, dynamic>),
      country: SimpleResponse.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'street': instance.street,
      'number': instance.number,
      'neighborhood': instance.neighborhood,
      'zipCode': instance.zipCode,
      'complement': instance.complement,
      'city': AddressModel._cityToJson(instance.city),
    };
