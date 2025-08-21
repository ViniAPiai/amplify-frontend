import 'package:equatable/equatable.dart';
import 'package:frontend/models/crm/card_type_enum.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/models/simple/simple_response.dart';

class NewCrmCardState extends Equatable {
  final bool isLoading;
  final bool isEditing;
  final String cardUuid;
  final SimpleResponse column;
  final CardTypeEnum cardType;
  final String title;
  final String defaultDescription;
  final DateTime defaultDueDate;
  final String getInTouchName;
  final String getInTouchEmail;
  final String getInTouchPhone;
  final String getInTouchMessage;
  final MessageModel message;
  final bool isSuccess;

  const NewCrmCardState({
    required this.message,
    required this.column,
    required this.defaultDueDate,
    this.cardUuid = '',
    this.title = '',
    this.defaultDescription = '',
    this.getInTouchName = '',
    this.getInTouchEmail = '',
    this.getInTouchPhone = '',
    this.getInTouchMessage = '',
    this.isLoading = true,
    this.isEditing = false,
    this.isSuccess = false,
    this.cardType = CardTypeEnum.defaultType,
  });

  NewCrmCardState copyWith({
    MessageModel? message,
    SimpleResponse? column,
    String? title,
    String? defaultDescription,
    DateTime? defaultDueDate,
    String? getInTouchName,
    String? getInTouchEmail,
    String? getInTouchPhone,
    String? getInTouchMessage,
    bool? isLoading,
    CardTypeEnum? cardType,
    String? cardUuid,
    bool? isEditing,
    bool? isSuccess,
  }) {
    return NewCrmCardState(
      message: message ?? this.message,
      column: column ?? this.column,
      title: title ?? this.title,
      defaultDescription: defaultDescription ?? this.defaultDescription,
      defaultDueDate: defaultDueDate ?? this.defaultDueDate,
      getInTouchName: getInTouchName ?? this.getInTouchName,
      getInTouchEmail: getInTouchEmail ?? this.getInTouchEmail,
      getInTouchPhone: getInTouchPhone ?? this.getInTouchPhone,
      getInTouchMessage: getInTouchMessage ?? this.getInTouchMessage,
      isLoading: isLoading ?? this.isLoading,
      cardType: cardType ?? this.cardType,
      cardUuid: cardUuid ?? this.cardUuid,
      isEditing: isEditing ?? this.isEditing,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    message,
    column,
    cardType,
    title,
    defaultDescription,
    defaultDueDate,
    getInTouchName,
    getInTouchEmail,
    getInTouchPhone,
    getInTouchMessage,
    isLoading,
    cardUuid,
    isEditing,
    isSuccess,
  ];
}
