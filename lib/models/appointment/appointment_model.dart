import 'package:flutter/material.dart';
import 'package:frontend/enums/tooth_code.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enum/appointment_status_enum.dart';

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
  late PatientModel? patient;
  @JsonKey(toJson: _userToUuid)
  late UserModel? doctor;
  @JsonKey(toJson: _userToUuid)
  late UserModel? nurse;
  @JsonKey(toJson: _appointmentTypeToUuid)
  late AppointmentTypeModel? appointmentType;
  @JsonKey(toJson: _procedureTypeToUuidList, fromJson: _procedureTypeFromJson)
  late List<ProcedureTypeModel>? procedureTypes;
  late List<ToothCode>? teeth;
  @JsonKey(fromJson: _clinicalExamFromJson, includeToJson: false)
  late ClinicalExamModel? clinicalExam;
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
      this.teeth,
      this.clinicalExam});

  factory AppointmentModel.empty({DateTime? date}) {
    return AppointmentModel(
      uuid: "",
      notes: "",
      date: date ?? DateTime.now(),
      startTime: TimeOfDay(hour: 0, minute: 0),
      endTime: TimeOfDay(hour: 0, minute: 0),
      patient: PatientModel.empty,
      doctor: UserModel.empty(),
      nurse: UserModel.empty(),
      appointmentType: AppointmentTypeModel.empty(),
      procedureTypes: [],
      teeth: [],
      clinicalExam: ClinicalExamModel.empty(),
    );
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    print(json["procedureTypes"]);
    return _$AppointmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  Map<String, dynamic> toJsonForInsert() {
    Map<String, dynamic> json = _$AppointmentModelToJson(this);
    json.remove("uuid");
    json.remove("message");
    json.remove("status");
    json["teeth"] = teeth!.map((e) => e.toUpperCase()).toList();
    return json;
  }

  AppointmentModel copyWith({
    String? uuid,
    String? notes,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    AppointmentStatusEnum? status,
    PatientModel? patient,
    UserModel? doctor,
    UserModel? nurse,
    AppointmentTypeModel? appointmentType,
    List<ProcedureTypeModel>? procedureTypes,
    List<ToothCode>? teeth,
    ClinicalExamModel? clinicalExam,
  }) {
    return AppointmentModel(
      uuid: uuid ?? this.uuid,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      patient: patient ?? this.patient,
      doctor: doctor ?? this.doctor,
      nurse: nurse ?? this.nurse,
      appointmentType: appointmentType ?? this.appointmentType,
      procedureTypes: procedureTypes ?? this.procedureTypes,
      teeth: teeth ?? this.teeth,
      clinicalExam: clinicalExam ?? this.clinicalExam,
    );
  }

  static String? _userToUuid(UserModel? user) => user?.uuid;

  static String? _appointmentTypeToUuid(AppointmentTypeModel? appointmentType) => appointmentType?.uuid;

  static List<String>? _procedureTypeToUuidList(List<ProcedureTypeModel>? procedureTypes) => procedureTypes?.map((e) => e.uuid).toList();

  static TimeOfDay _timeOfDayFromDateTime(String time) => TimeOfDay(hour: int.parse(time.split(":")[0]), minute: int.parse(time.split(":")[1]));

  static String _timeOfDayToString(TimeOfDay time) => "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}";

  static List<ProcedureTypeModel>? _procedureTypeFromJson(List<dynamic>? procedureTypes) {
    if (procedureTypes == null) return null;
    return procedureTypes.map((e) => ProcedureTypeModel.fromJson(e)).toList();
  }

  static ClinicalExamModel? _clinicalExamFromJson(Map<String, dynamic>? json) {
    if (json == null) return ClinicalExamModel.empty();
    return ClinicalExamModel.fromJson(json);
  }

  @override
  String toString() {
    return 'AppointmentModel{uuid: $uuid, notes: $notes, date: $date, startTime: $startTime, endTime: $endTime, status: $status, patient: $patient, doctor: $doctor, nurse: $nurse, appointmentType: $appointmentType, procedureTypes: $procedureTypes, teeth: $teeth, clinicalExam: $clinicalExam, message: $message}';
  }
}
