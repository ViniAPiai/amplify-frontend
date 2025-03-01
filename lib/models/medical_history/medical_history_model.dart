
import 'package:json_annotation/json_annotation.dart';

part 'medical_history_model.g.dart';

@JsonSerializable()
class MedicalHistoryModel {

  late String uuid;
  late bool hasDiabetes;
  late bool hasHypertension;
  late bool hasHeartProblems;
  late bool hasEpilepsy;
  late bool hasAsthma;
  late bool hasOsteoporosis;
  late String? allergies;
  late String? medications;
  late String? surgeries;
  late bool hasAnestheticAllergy;
  late bool hasBleedingIssues;
  late bool isPregnant;
  late int? pregnancyMonth;

  MedicalHistoryModel(this.uuid, this.hasDiabetes, this.hasHypertension, this.hasHeartProblems, this.hasEpilepsy, this.hasAsthma, this.hasOsteoporosis,
      this.allergies, this.medications, this.surgeries, this.hasAnestheticAllergy, this.hasBleedingIssues, this.isPregnant, this.pregnancyMonth);

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) => _$MedicalHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalHistoryModelToJson(this);

}