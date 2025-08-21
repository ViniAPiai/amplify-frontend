import 'package:equatable/equatable.dart';
import 'package:frontend/models/crm/card/card.model.dart';
import 'package:frontend/models/simple/simple_response.dart';

abstract class CrmEvent extends Equatable {
  const CrmEvent();

  @override
  List<Object?> get props => [];
}

class CrmCreateColumn extends CrmEvent {
  final int index;
  final String name;

  const CrmCreateColumn({
    required this.index,
    required this.name,
  });
}

class CrmLoadBoard extends CrmEvent {}

class CrmLoadColumnExcludeOne extends CrmEvent {
  final String uuid;

  const CrmLoadColumnExcludeOne({
    required this.uuid,
  });
}

class CrmChangeColumnOrder extends CrmEvent {
  final String oldColumnUuid;
  final int newIndex;

  const CrmChangeColumnOrder({
    required this.oldColumnUuid,
    required this.newIndex,
  });

  @override
  List<Object?> get props => [oldColumnUuid, newIndex];
}

class CrmMoveColumn extends CrmEvent {
  final String columnUuid;
  final int index;

  const CrmMoveColumn({
    required this.columnUuid,
    required this.index,
  });
}

class CrmChangeCardPosition extends CrmEvent {
  final CardModel card;
  final String oldColumnUuid;
  final int oldCardIndex;
  final String columnUuid;
  final int newIndex;
  final bool sameColumn;

  const CrmChangeCardPosition({
    required this.card,
    required this.oldColumnUuid,
    required this.oldCardIndex,
    required this.columnUuid,
    required this.sameColumn,
    this.newIndex = 0,
  });
}

class CrmUpdateFields extends CrmEvent {
  final String? excludeColumnName;
  final SimpleResponse? selectedColumn;

  const CrmUpdateFields({
    this.excludeColumnName,
    this.selectedColumn,
  });

  @override
  List<Object?> get props => [excludeColumnName, selectedColumn];
}

class CrmDeleteColumn extends CrmEvent {
  final String uuid;

  const CrmDeleteColumn({
    required this.uuid,
  });
}

class CrmDeleteCard extends CrmEvent {
  final String uuid;

  const CrmDeleteCard({
    required this.uuid,
  });
}
