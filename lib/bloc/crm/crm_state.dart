
import 'package:equatable/equatable.dart';
import 'package:frontend/models/crm/columns/columns.model.dart';
import 'package:frontend/models/simple/simple_response.dart';

class CrmState extends Equatable {

  final bool isLoading;
  final Map<String, ColumnsModel> columns;
  final List<String> columnsOrder;
  final SimpleResponse selectedColumn;
  final String removeColumName;

  const CrmState({
    required this.columns,
    required this.columnsOrder,
    required this.selectedColumn,
    this.isLoading = true,
    this.removeColumName = '',
  });

  CrmState copyWith({
    Map<String, ColumnsModel>? columns,
    List<String>? columnsOrder,
    bool? isLoading,
    SimpleResponse? selectedColumn,
    String? removeColumName,
  }) {
    return CrmState(
      columns: columns ?? this.columns,
      columnsOrder: columnsOrder ?? this.columnsOrder,
      isLoading: isLoading ?? this.isLoading,
      selectedColumn: selectedColumn ?? this.selectedColumn,
      removeColumName: removeColumName ?? this.removeColumName,
    );
  }

  @override
  List<Object?> get props => [columns, columnsOrder, isLoading, selectedColumn];

}