import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/models/message/message_model.dart';

enum NewCrmColumnDirection {
  left,
  right;

  String getValue(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    switch (this) {
      case NewCrmColumnDirection.left:
        return t.crmLeft;
      case NewCrmColumnDirection.right:
        return t.crmRight;
    }
  }
}

class NewCrmColumnState extends Equatable {
  final bool isLoading;
  final String refColumnName;
  final String name;
  final NewCrmColumnDirection direction;
  final int index;
  final MessageModel message;

  const NewCrmColumnState(
      {this.isLoading = false, this.name = '', this.refColumnName = '', this.direction = NewCrmColumnDirection.left, this.index = 0, required this.message});

  NewCrmColumnState copyWith({bool? isLoading, String? name, String? refColumnName, NewCrmColumnDirection? direction, int? index, MessageModel? message}) {
    return NewCrmColumnState(
        isLoading: isLoading ?? this.isLoading,
        refColumnName: refColumnName ?? this.refColumnName,
        name: name ?? this.name,
        direction: direction ?? this.direction,
        index: index ?? this.index,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [isLoading, refColumnName, name, direction, index, message];
}
