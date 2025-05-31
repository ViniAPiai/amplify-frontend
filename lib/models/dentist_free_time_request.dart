
import 'package:json_annotation/json_annotation.dart';

part 'dentist_free_time_request.g.dart';

@JsonSerializable()
class DentistFreeTimeRequest {

  late final DateTime date;
  late final List<String> procedureTypeUuids;

  DentistFreeTimeRequest({required this.date, required this.procedureTypeUuids});

  factory DentistFreeTimeRequest.fromJson(Map<String, dynamic> json) => _$DentistFreeTimeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DentistFreeTimeRequestToJson(this);

}