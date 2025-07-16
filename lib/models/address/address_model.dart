import 'package:frontend/models/simple/simple_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  late String? uuid;
  late String street;
  late String number;
  late String neighborhood;
  late String zipCode;
  late String complement;
  @JsonKey(toJson: _cityToJson)
  late SimpleResponse city;
  @JsonKey(includeToJson: false)
  late SimpleResponse state;
  @JsonKey(includeToJson: false)
  late SimpleResponse country;

  AddressModel(
      {this.uuid,
      required this.street,
      required this.number,
      required this.neighborhood,
      required this.zipCode,
      required this.complement,
      required this.city,
      required this.state,
      required this.country});

  static final empty = AddressModel(
      street: "",
      number: "",
      neighborhood: "",
      zipCode: "",
      complement: "",
      city: SimpleResponse(uuid: '', name: ''),
      state: SimpleResponse(uuid: '', name: ''),
      country: SimpleResponse(uuid: '', name: ''));

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  static String _cityToJson(SimpleResponse city) => city.uuid;
}
