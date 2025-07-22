
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/crm/crm_event.dart';
import 'package:frontend/bloc/crm/crm_state.dart';
import 'package:frontend/models/crm/columns/columns.model.dart';
import 'package:frontend/services/api_service.dart';

class CrmBloc extends Bloc<CrmEvent, CrmState> {

  CrmBloc() : super(const CrmState(columns: {}, columnsOrder: [])) {
    on<CrmLoadBoard>(_onCrmLoadBoard);
    on<CrmChangeColumnOrder>(_onCrmChangeColumnOrder);
    on<CrmChangeCardPosition>(_onCrmChangeCardPosition);
  }

  void _onCrmLoadBoard(CrmLoadBoard event, Emitter<CrmState> emit) async {
    emit(state.copyWith(columns: {}, columnsOrder: [], isLoading: true));
    List<ColumnsModel> columns = await (await ApiService.create()).client.findAllColumns();
    Map<String, ColumnsModel> mapColumns = {};
    List<String> columnsOrder = [];
    for(ColumnsModel column in columns) {
      mapColumns.putIfAbsent(column.uuid, () => column);
      columnsOrder.add(column.uuid);
    }
    emit(state.copyWith(columns: mapColumns, columnsOrder: columnsOrder, isLoading: false));
  }

  void _onCrmChangeColumnOrder(CrmChangeColumnOrder event, Emitter<CrmState> emit) async {
    /*List<String> columnsOrder = List.from(state.columnsOrder);
    final oldIndex = state.columnsOrder.indexOf(event.oldColumnUuid);
    final newIndex = state.columnsOrder.indexOf(event.columnUuid);
    columnsOrder.removeAt(oldIndex);
    columnsOrder.insert(newIndex, event.oldColumnUuid);
    emit(state.copyWith(columnsOrder: columnsOrder));*/
    emit(state.copyWith(isLoading: true));
    final newIndex = state.columnsOrder.indexOf(event.columnUuid);
    await (await ApiService.create()).client.changePositionColumns({'uuid': event.oldColumnUuid, 'newPosition': newIndex});
    add(CrmLoadBoard());
  }

  void _onCrmChangeCardPosition(CrmChangeCardPosition event, Emitter<CrmState> emit) async{
    
    /*Map<String, ColumnsModel> columns = Map.from(state.columns);
    columns[event.oldColumnUuid]!.cards.removeAt(event.oldCardIndex);
    if(event.sameColumn) {
      print('aqui');
      print('index: ${event.newIndex}, cards length: ${columns[event.columnUuid]!.cards.length}');
      columns[event.oldColumnUuid]!.cards.removeAt(event.oldCardIndex);
      final targetIndex = event.newIndex.clamp(0, columns[event.columnUuid]!.cards.length);
      if (targetIndex == columns[event.columnUuid]!.cards.length) {
        columns[event.columnUuid]!.cards.add(event.card.copyWith(index: targetIndex));
      } else {
        columns[event.columnUuid]!.cards.insert(targetIndex, event.card.copyWith(index: targetIndex));
      }

      for (var i = 0; i < columns[event.columnUuid]!.cards.length; i++) {
        columns[event.columnUuid]!.cards[i] = columns[event.columnUuid]!.cards[i].copyWith(index: i);
      }
    }else {
      columns[event.columnUuid]!.cards.add(event.card.copyWith(index: state.columns[event.columnUuid]!.cards.length));
    }
    emit(state.copyWith(columns: columns));*/
  }

}