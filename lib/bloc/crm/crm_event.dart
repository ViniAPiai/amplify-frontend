import 'package:equatable/equatable.dart';
import 'package:frontend/models/crm/card/card.model.dart';

abstract class CrmEvent extends Equatable {
  const CrmEvent();

  @override
  List<Object?> get props => [];
}

class CrmLoadBoard extends CrmEvent {}

class CrmChangeColumnOrder extends CrmEvent {
  final String oldColumnUuid;
  final String columnUuid;

  const CrmChangeColumnOrder({
    required this.oldColumnUuid,
    required this.columnUuid,
  });

  @override
  List<Object?> get props => [oldColumnUuid, columnUuid];
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
