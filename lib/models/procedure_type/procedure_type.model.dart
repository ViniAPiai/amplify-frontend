
import 'package:json_annotation/json_annotation.dart';

part 'procedure_type.model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProcedureTypeModel {

  late String uuid;
  late String name;

  ProcedureTypeModel({required this.uuid, required this.name});

  factory ProcedureTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProcedureTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProcedureTypeModelToJson(this);

}