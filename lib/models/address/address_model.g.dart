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
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'street': instance.street,
      'number': instance.number,
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
    };
