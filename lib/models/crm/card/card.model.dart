import 'package:json_annotation/json_annotation.dart';

part 'card.model.g.dart';

@JsonSerializable()
class CardModel {
  final String uuid;
  final int index;
  final String title;
  final String description;
  final DateTime dueDate;

  CardModel({
    required this.uuid,
    required this.index,
    required this.title,
    required this.description,
    required this.dueDate,
  });

  CardModel copyWith({
    String? uuid,
    int? index,
    String? title,
    String? description,
    DateTime? dueDate,
  }) {
    return CardModel(
      uuid: uuid ?? this.uuid,
      index: index ?? this.index,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);

  Map<String, dynamic> toJsonInsert(String columnsUuid) => {
        "columns_uuid": columnsUuid,
        "index": index,
        "title": title,
        "description": description,
        "due_date": dueDate.toIso8601String(),
      };

  Map<String, dynamic> toJsonUpdate() => {
        'uuid': uuid,
        'title': title,
        'description': description,
        'due_date': dueDate.toIso8601String(),
      };

  Map<String, dynamic> toShow() => {'uuid': uuid, 'index': index, 'title': title, 'description': description, 'due_date': dueDate, 'type': 'card'};
}
