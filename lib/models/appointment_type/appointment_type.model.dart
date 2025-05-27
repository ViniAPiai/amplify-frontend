
import 'package:json_annotation/json_annotation.dart';

part 'appointment_type.model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppointmentTypeModel {

  late String uuid;
  late String name;

  AppointmentTypeModel({required this.uuid, required this.name});

  factory AppointmentTypeModel.empty() {
    return AppointmentTypeModel(uuid: "", name: "");
  }

  factory AppointmentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentTypeModelToJson(this);

}