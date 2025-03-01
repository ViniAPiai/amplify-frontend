


import 'package:frontend/models/patient/patient_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_patient_response_model.g.dart';

@JsonSerializable()
class PagePatientResponseModel {

  late List<PatientModel> content;
  late int totalPages;
  late int totalItems;

  PagePatientResponseModel({required this.content, required this.totalPages});

  factory PagePatientResponseModel.fromJson(Map<String, dynamic> json) => _$PagePatientResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagePatientResponseModelToJson(this);


}