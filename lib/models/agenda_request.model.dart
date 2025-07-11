
import 'package:frontend/models/appointment/enum/appointment_interval_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agenda_request.model.g.dart';

@JsonSerializable()
class AgendaRequestModel {

  @JsonKey(toJson: intervalToJson)
  late final AppointmentIntervalEnum interval;
  late final DateTime day;

  AgendaRequestModel({required this.interval, required this.day});

  factory AgendaRequestModel.fromJson(Map<String, dynamic> json) => _$AgendaRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgendaRequestModelToJson(this);

  static String intervalToJson(AppointmentIntervalEnum interval) => interval.value;

}