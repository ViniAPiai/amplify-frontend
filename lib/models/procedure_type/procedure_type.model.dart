
import 'package:frontend/models/procedure_type/procedure_type.enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'procedure_type.model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProcedureTypeModel {

  late String uuid;
  late ProcedureTypeEnum name;
  late double basePrice;
  late int time;

  ProcedureTypeModel(this.uuid, this.name, this.basePrice, this.time);

  factory ProcedureTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProcedureTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProcedureTypeModelToJson(this);

}