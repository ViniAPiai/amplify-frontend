import 'package:frontend/models/crm/card_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.model.g.dart';

@JsonSerializable()
class CardModel {
  final String uuid;
  final int index;
  final String title;
  final CardTypeEnum type;
  final Map<String, dynamic> extraData;

  CardModel({
    required this.uuid,
    required this.index,
    required this.title,
    required this.type,
    required this.extraData
  });

  CardModel copyWith({
    String? uuid,
    int? index,
    String? title,
    CardTypeEnum? type,
    Map<String, dynamic>? extraData,
  }) {
    return CardModel(
      uuid: uuid ?? this.uuid,
      index: index ?? this.index,
      title: title ?? this.title,
      type: type ?? this.type,
      extraData: extraData ?? this.extraData,
    );
  }

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);

}
