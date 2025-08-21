import 'package:frontend/models/crm/card/card.model.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'columns.model.g.dart';

@JsonSerializable()
class ColumnsModel {
  final String uuid;
  final int index;
  final String name;
  @JsonKey(fromJson: _cardFromJson)
  final List<CardModel> cards;

  ColumnsModel({
    required this.uuid,
    required this.index,
    required this.name,
    required this.cards,
  });

  ColumnsModel copyWith({
    String? uuid,
    int? index,
    String? name,
  }) {
    return ColumnsModel(
      uuid: uuid ?? this.uuid,
      index: index ?? this.index,
      name: name ?? this.name,
      cards: cards,
    );
  }

  factory ColumnsModel.fromJson(Map<String, dynamic> json) => _$ColumnsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnsModelToJson(this);

  Map<String, dynamic> toJsonInsert() => {
        "index": index,
        "name": name,
      };

  Map<String, dynamic> toJsonUpdate() => {
        'uuid': uuid,
        'name': name,
      };

  SimpleResponse toSimpleResponse() {
    return SimpleResponse(uuid: uuid, name: name);
  }

  Map<String, dynamic> toShow() => {'uuid': uuid, 'index': index, 'name': name, 'type': 'column'};

  static List<CardModel> _cardFromJson(List<dynamic> cards) {
    return cards.map((e) => CardModel.fromJson(e)).toList();
  }

  @override
  String toString() {
    return 'ColumnsModel{uuid: $uuid, index: $index, name: $name}';
  }
}
