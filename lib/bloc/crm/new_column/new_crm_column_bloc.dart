import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_event.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_state.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/services/api_service.dart';

class NewCrmColumnBloc extends Bloc<NewCrmColumnEvent, NewCrmColumnState> {
  NewCrmColumnBloc() : super(NewCrmColumnState(name: '', direction: NewCrmColumnDirection.left, message: MessageModel(message: ''))) {
    on<NewCrmColumnInsert>(_onNewCrmColumnInsert);
    on<NewCrmColumnLoad>(_onNewCrmColumnLoad);
    on<NewCrmColumnUpdateFields>(_onNewCrmColumnUpdateFields);
  }

  void _onNewCrmColumnInsert(NewCrmColumnInsert event, Emitter<NewCrmColumnState> emit) async {
    emit(state.copyWith(isLoading: true));
    int index;
    if (state.direction == NewCrmColumnDirection.left) {
      index = state.index - 1;
      if (index < 0) index = 0;
    } else {
      index = state.index + 1;
    }
    MessageModel message = await (await ApiService.create()).client.insertColumn({"index": state.index, "name": state.name});
    emit(state.copyWith(isLoading: false, message: message));
  }

  void _onNewCrmColumnLoad(NewCrmColumnLoad event, Emitter<NewCrmColumnState> emit) {
    emit(state.copyWith(index: event.index, refColumnName: event.refColumnName));
  }

  void _onNewCrmColumnUpdateFields(NewCrmColumnUpdateFields event, Emitter<NewCrmColumnState> emit) {
    emit(state.copyWith(
        isLoading: event.isLoading ?? state.isLoading,
        refColumnName: event.refColumnName ?? state.refColumnName,
        name: event.name ?? state.name,
        direction: event.direction ?? state.direction,
        index: event.index ?? state.index,
        message: event.message ?? state.message));
  }
}
