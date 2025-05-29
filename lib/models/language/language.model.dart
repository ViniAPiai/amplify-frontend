
import 'package:json_annotation/json_annotation.dart';

part 'language.model.g.dart';

@JsonSerializable()
class LanguageModel {

    late final String uuid;
    late final String code;

    LanguageModel(this.uuid, this.code);

    Map<String, dynamic> toJson() => _$LanguageModelToJson(this);

    factory LanguageModel.fromJson(Map<String, dynamic> json) => _$LanguageModelFromJson(json);

}