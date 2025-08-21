import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/crm/crm_event.dart';
import 'package:frontend/bloc/crm/crm_state.dart';
import 'package:frontend/models/crm/columns/columns.model.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:frontend/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class CrmBloc extends Bloc<CrmEvent, CrmState> {
  CrmBloc() : super(CrmState(columns: const {}, columnsOrder: const [], selectedColumn: SimpleResponse(uuid: '', name: ''))) {
    on<CrmCreateColumn>(_onCrmCreateColumn);
    on<CrmLoadBoard>(_onCrmLoadBoard);
    on<CrmChangeColumnOrder>(_onCrmChangeColumnOrder);
    on<CrmChangeCardPosition>(_onCrmChangeCardPosition);
    on<CrmUpdateFields>(_onCrmUpdateFields);
    on<CrmDeleteColumn>(_onCrmDeleteColumn);
  }

  void _onCrmCreateColumn(CrmCreateColumn event, Emitter<CrmState> emit) async {
    emit(state.copyWith(isLoading: true));
    await (await ApiService.create()).client.insertColumn({'name': event.name, 'index': event.index}).then(
      (value) {
        toastification.show(
            title: Text(value.message!, style: GoogleFonts.montserrat(fontSize: 18, color: CupertinoColors.black, fontWeight: FontWeight.w500)),
            type: ToastificationType.success,
            style: ToastificationStyle.minimal,
            autoCloseDuration: Duration(seconds: 5));
        add(CrmLoadBoard());
      },
    );
  }

  void _onCrmLoadBoard(CrmLoadBoard event, Emitter<CrmState> emit) async {
    emit(state.copyWith(columns: {}, columnsOrder: [], isLoading: true));
    List<ColumnsModel> columns = await (await ApiService.create()).client.findAllColumn();
    Map<String, ColumnsModel> mapColumns = {};
    List<String> columnsOrder = [];
    for (ColumnsModel column in columns) {
      mapColumns.putIfAbsent(column.uuid, () => column);
      columnsOrder.add(column.uuid);
    }
    emit(state.copyWith(columns: mapColumns, columnsOrder: columnsOrder, selectedColumn: SimpleResponse(uuid: '', name: ''), isLoading: false));
  }

  void _onCrmChangeColumnOrder(CrmChangeColumnOrder event, Emitter<CrmState> emit) async {
    emit(state.copyWith(isLoading: true));
    await (await ApiService.create()).client.changePositionColumn({'uuid': event.oldColumnUuid, 'newPosition': event.newIndex});
    add(CrmLoadBoard());
  }

  void _onCrmChangeCardPosition(CrmChangeCardPosition event, Emitter<CrmState> emit) async {
    emit(state.copyWith(isLoading: true));
    if (event.sameColumn) {
      Map<String, dynamic> requestBody = {"uuid": event.card.uuid, "index": event.newIndex, "columnUuid": null};
      await (await ApiService.create()).client.changePositionCard(requestBody);
    } else {
      Map<String, dynamic> requestBody = {"uuid": event.card.uuid, "index": event.newIndex, "columnUuid": event.columnUuid};
      await (await ApiService.create()).client.changePositionCard(requestBody);
    }
    add(CrmLoadBoard());
  }

  void _onCrmUpdateFields(CrmUpdateFields event, Emitter<CrmState> emit) {
    emit(state.copyWith(removeColumName: event.excludeColumnName, selectedColumn: event.selectedColumn));
  }

  void _onCrmDeleteColumn(CrmDeleteColumn event, Emitter<CrmState> emit) async {
    emit(state.copyWith(isLoading: true));
    (await ApiService.create()).client.deleteColumn({'uuid': event.uuid, 'columnToMoveCardsUuid': state.selectedColumn.uuid}).then(
      (value) {
        add(CrmLoadBoard());
      },
    );
  }
}
