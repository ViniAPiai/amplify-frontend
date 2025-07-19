
import 'package:equatable/equatable.dart';
import 'package:frontend/models/crm/columns/columns.model.dart';

class CrmState extends Equatable {

  final bool isLoading;
  final Map<String, ColumnsModel> columns;
  final List<String> columnsOrder;

  const CrmState({
    required this.columns,
    required this.columnsOrder,
    this.isLoading = true,
  });

  CrmState copyWith({
    Map<String, ColumnsModel>? columns,
    List<String>? columnsOrder,
    bool? isLoading,
  }) {
    return CrmState(
      columns: columns ?? this.columns,
      columnsOrder: columnsOrder ?? this.columnsOrder,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [columns, columnsOrder, isLoading];

}