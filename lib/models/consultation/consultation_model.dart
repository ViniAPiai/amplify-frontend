
import 'package:frontend/models/consultation/consultation_status_enum.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_model.g.dart';

@JsonSerializable()
class ConsultationModel {

  late String? uuid;
  late String? description;
  late DateTime startTime;
  late DateTime endTime;
  late ConsultationStatusEnum? status;
  late UserModel? patient;
  late UserModel? doctor;
  late UserModel? nurse;
  late String? message;

  ConsultationModel({this.uuid, this.description, required this.startTime,
    required this.endTime, this.status, this.patient, this.doctor, this.nurse, this.message});

  factory ConsultationModel.fromJson(Map<String, dynamic> json) => _$ConsultationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);

}