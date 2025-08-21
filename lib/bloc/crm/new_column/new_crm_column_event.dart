import 'package:equatable/equatable.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_state.dart';
import 'package:frontend/models/message/message_model.dart';

abstract class NewCrmColumnEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewCrmColumnLoad extends NewCrmColumnEvent {
  final int index;
  final String refColumnName;

  NewCrmColumnLoad({required this.index, required this.refColumnName});
}

class NewCrmColumnInsert extends NewCrmColumnEvent {}

class NewCrmColumnUpdateFields extends NewCrmColumnEvent {
  final bool? isLoading;
  final String? refColumnName;
  final String? name;
  final NewCrmColumnDirection? direction;
  final int? index;
  final MessageModel? message;

  NewCrmColumnUpdateFields({this.isLoading, this.refColumnName, this.name, this.direction, this.index, this.message});
}
