
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {

  late int id;
  late String street;
  late String number;
  late String neighborhood;
  late String city;
  late String state;
  late String country;

  AddressModel(this.id, this.street, this.number, this.neighborhood, this.city, this.state, this.country);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

}