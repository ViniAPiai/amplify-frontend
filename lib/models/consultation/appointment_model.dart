import 'package:flutter/material.dart';
import 'package:frontend/enums/tooth_code.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/consultation/appointment_status_enum.dart';
import 'package:frontend/models/dentist_free_time/time_range.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  late String? uuid;
  late String? notes;
  late DateTime date;
  @JsonKey(fromJson: _timeOfDayFromDateTime, toJson: _timeOfDayToString)
  late TimeOfDay startTime;
  @JsonKey(fromJson: _timeOfDayFromDateTime, toJson: _timeOfDayToString)
  late TimeOfDay endTime;
  late AppointmentStatusEnum? status;
  @JsonKey(toJson: _userToUuid)
  late UserModel? patient;
  @JsonKey(toJson: _userToUuid)
  late UserModel? doctor;
  @JsonKey(toJson: _userToUuid)
  late UserModel? nurse;
  @JsonKey(toJson: _appointmentTypeToUuid)
  late AppointmentTypeModel? appointmentType;
  @JsonKey(toJson: _procedureTypeToUuidList, fromJson: _procedureTypeFromJson)
  late List<ProcedureTypeModel>? procedureTypes;
  late List<ToothCode>? teeth;
  @JsonKey(includeToJson: false)
  late String? message;

  AppointmentModel(
      {this.uuid,
      this.notes,
      required this.date,
      required this.startTime,
      required this.endTime,
      this.appointmentType,
      this.status,
      this.patient,
      this.doctor,
      this.nurse,
      this.procedureTypes,
      this.message,
      this.teeth});

  factory AppointmentModel.empty(DateTime date) {
    return AppointmentModel(
      uuid: "",
      notes: "",
      date: date,
      startTime: TimeOfDay(hour: 0, minute: 0),
      endTime: TimeOfDay(hour: 0, minute: 0),
      patient: UserModel.empty(),
      doctor: UserModel.empty(),
      nurse: UserModel.empty(),
      appointmentType: AppointmentTypeModel.empty(),
      procedureTypes: [],
      teeth: [],
    );
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  Map<String, dynamic> toJsonForInsert() {
    Map<String, dynamic> json = _$AppointmentModelToJson(this);
    json.remove("uuid");
    json.remove("message");
    json.remove("status");
    json["teeth"] = teeth!.map((e) => e.toUpperCase()).toList();
    return json;
  }

  static String? _userToUuid(UserModel? user) => user?.uuid;

  static String? _appointmentTypeToUuid(AppointmentTypeModel? appointmentType) => appointmentType?.uuid;

  static List<String>? _procedureTypeToUuidList(List<ProcedureTypeModel>? procedureTypes) => procedureTypes?.map((e) => e.uuid).toList();

  static TimeOfDay _timeOfDayFromDateTime(String time) => TimeOfDay(hour: int.parse(time.split(":")[0]), minute: int.parse(time.split(":")[1]));

  static String _timeOfDayToString(TimeOfDay time) => "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}";

  static List<ToothCode> _fromJsonTeeth(dynamic json) =>
      (json as List<dynamic>).map((e) => ToothCode.fromString(e)).toList();

  static List<String> _toJsonTeeth(List<ToothCode> teeth) => teeth.map((e) => e.toUpperCase()).toList();

  static List<ProcedureTypeModel>? _procedureTypeFromJson(List<Map<String, dynamic>>? procedureTypes) {
    if (procedureTypes == null) return null;
    return procedureTypes.map((e) => ProcedureTypeModel.fromJson(e)).toList();
  }

}
