
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {

  late String? uuid;
  late String street;
  late String number;
  late String neighborhood;
  late String city;
  late String state;
  late String country;

  AddressModel({this.uuid, required this.street, required this.number, required this.neighborhood, required this.city,
    required this.state, required this.country});

  static final empty = AddressModel(street: "", number: "", neighborhood: "", city: "", state: "", country: "");

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

}