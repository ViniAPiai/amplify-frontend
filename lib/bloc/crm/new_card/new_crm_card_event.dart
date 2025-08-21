import 'package:equatable/equatable.dart';
import 'package:frontend/models/crm/card_type_enum.dart';
import 'package:frontend/models/message/message_model.dart';

abstract class NewCrmCardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewCrmCardInsert extends NewCrmCardEvent {}

class NewCrmCardLoad extends NewCrmCardEvent {
  final String columnUuid;
  final String cardUuid;

  NewCrmCardLoad({required this.columnUuid, this.cardUuid = ''});

  @override
  List<Object?> get props => [columnUuid];
}

class NewCrmCardUpdateFields extends NewCrmCardEvent {
  final MessageModel? message;
  final CardTypeEnum? cardType;
  final String? title;
  final String? defaultDescription;
  final DateTime? defaultDueDate;
  final String? getInTouchName;
  final String? getInTouchEmail;
  final String? getInTouchPhone;
  final String? getInTouchMessage;

  NewCrmCardUpdateFields({
    this.message,
    this.cardType,
    this.title,
    this.defaultDescription,
    this.defaultDueDate,
    this.getInTouchName,
    this.getInTouchEmail,
    this.getInTouchPhone,
    this.getInTouchMessage,
  });


  @override
  List<Object?> get props => [
    message,
    cardType,
    title,
    defaultDescription,
    defaultDueDate,
    getInTouchName,
    getInTouchEmail,
    getInTouchPhone,
    getInTouchMessage,
  ];
}
