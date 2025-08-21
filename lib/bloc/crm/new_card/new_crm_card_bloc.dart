import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/crm/new_card/new_crm_card_event.dart';
import 'package:frontend/models/crm/card/card.model.dart';
import 'package:frontend/models/crm/card_type_enum.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:frontend/services/api_service.dart';

import 'new_crm_card_state.dart';

class NewCrmCardBloc extends Bloc<NewCrmCardEvent, NewCrmCardState> {
  NewCrmCardBloc() : super(NewCrmCardState(message: MessageModel(), defaultDueDate: DateTime.now(), column: SimpleResponse(uuid: '', name: ''))) {
    on<NewCrmCardInsert>(_onNewCrmCardInsert);
    on<NewCrmCardLoad>(_onNewCrmCardLoad);
    on<NewCrmCardUpdateFields>(_onNewCrmCardUpdateFields);
  }

  void _onNewCrmCardInsert(NewCrmCardInsert event, Emitter<NewCrmCardState> emit) async {
    emit(state.copyWith(isLoading: true));
    MessageModel message;
    if(state.cardType == CardTypeEnum.defaultType) {
      message = await (await ApiService.create()).client.insertDefaultCard(state.column.uuid, {
        "title": state.title,
        "description": state.defaultDescription,
        "dueDate": state.defaultDueDate.toIso8601String(),
      });
    } else {
      message = await (await ApiService.create()).client.insertGetInTouchCard(state.column.uuid, {
        "title": state.title,
        "name": state.getInTouchName,
        "email": state.getInTouchEmail,
        "phoneNumber": state.getInTouchPhone,
        "message": state.getInTouchMessage,
      });
    }
    emit(state.copyWith(message: message, isLoading: false, isSuccess: true));
  }

  void _onNewCrmCardLoad(NewCrmCardLoad event, Emitter<NewCrmCardState> emit) async {
    emit(state.copyWith(isLoading: true));
    SimpleResponse response = await (await ApiService.create()).client.findColumnSimple(event.columnUuid);
    emit(state.copyWith(column: response));
    if (event.cardUuid.isNotEmpty) {
      CardModel card = await (await ApiService.create()).client.findCard(event.cardUuid);
      emit(state.copyWith(
          isEditing: true,
          cardUuid: card.uuid,
          title: card.title,
          defaultDescription: card.extraData['description'],
          defaultDueDate: card.extraData["dueDate"],
          cardType: card.type,
          isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onNewCrmCardUpdateFields(NewCrmCardUpdateFields event, Emitter<NewCrmCardState> emit) {
    emit(state.copyWith(
        message: event.message,
        cardType: event.cardType,
        title: event.title,
        defaultDescription: event.defaultDescription,
        defaultDueDate: event.defaultDueDate,
        getInTouchName: event.getInTouchName,
        getInTouchEmail: event.getInTouchEmail,
        getInTouchPhone: event.getInTouchPhone,
        getInTouchMessage: event.getInTouchMessage));
  }
}
