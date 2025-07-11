
import 'package:frontend/models/appointment_type/appointment_type.enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_type.model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppointmentTypeModel {

  late String uuid;
  late AppointmentTypeEnum name;

  AppointmentTypeModel({required this.uuid, required this.name});

  factory AppointmentTypeModel.empty() {
    return AppointmentTypeModel(uuid: "", name: AppointmentTypeEnum.generalConsult);
  }

  factory AppointmentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentTypeModelToJson(this);

  @override
  String toString() {
    return 'AppointmentTypeModel{uuid: $uuid, name: $name}';
  }
}