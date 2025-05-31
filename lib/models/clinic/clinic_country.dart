

import 'package:json_annotation/json_annotation.dart';

part 'clinic_country.g.dart';

@JsonSerializable()
class ClinicCountry {

  late final String country;

  ClinicCountry({required this.country});

  factory ClinicCountry.fromJson(Map<String, dynamic> json) => _$ClinicCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicCountryToJson(this);

}
