
import 'package:json_annotation/json_annotation.dart';

part 'clinical_exam.model.g.dart';

@JsonSerializable(explicitToJson: true)
class ClinicalExamModel {

  late String uuid;
  late bool hasCavities;
  late bool hasToothWear;
  late bool hasFractures;
  late bool hasGumBleeding;
  late bool hasGumInflammation;
  late bool hasGumRecession;
  late String otherObservations;
  late String? message;

  ClinicalExamModel({
    required this.uuid,
    required this.hasCavities,
    required this.hasToothWear,
    required this.hasFractures,
    required this.hasGumBleeding,
    required this.hasGumInflammation,
    required this.hasGumRecession,
    required this.otherObservations,
    required this.message,
  });

  factory ClinicalExamModel.empty() => ClinicalExamModel(
    uuid: "",
    hasCavities: false,
    hasToothWear: false,
    hasFractures: false,
    hasGumBleeding: false,
    hasGumInflammation: false,
    hasGumRecession: false,
    otherObservations: "",
    message: "",
  );

  static ClinicalExamModel e = ClinicalExamModel(
    uuid: "",
    hasCavities: false,
    hasToothWear: false,
    hasFractures: false,
    hasGumBleeding: false,
    hasGumInflammation: false,
    hasGumRecession: false,
    otherObservations: "",
    message: "",
  );

  ClinicalExamModel copyWith({
    String? uuid,
    bool? hasCavities,
    bool? hasToothWear,
    bool? hasFractures,
    bool? hasGumBleeding,
    bool? hasGumInflammation,
    bool? hasGumRecession,
    String? otherObservations,
  }) {
    return ClinicalExamModel(
      uuid: uuid ?? this.uuid,
      hasCavities: hasCavities ?? this.hasCavities,
      hasToothWear: hasToothWear ?? this.hasToothWear,
      hasFractures: hasFractures ?? this.hasFractures,
      hasGumBleeding: hasGumBleeding ?? this.hasGumBleeding,
      hasGumInflammation: hasGumInflammation ?? this.hasGumInflammation,
      hasGumRecession: hasGumRecession ?? this.hasGumRecession,
      otherObservations: otherObservations ?? this.otherObservations, message: '',
    );
  }

  factory ClinicalExamModel.fromJson(Map<String, dynamic> json) => _$ClinicalExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicalExamModelToJson(this);

}