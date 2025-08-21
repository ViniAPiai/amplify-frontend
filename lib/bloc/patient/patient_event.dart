import 'package:equatable/equatable.dart';

abstract class PatientEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateSearchTermEvent extends PatientEvent {
  final String searchTerm;

  UpdateSearchTermEvent(this.searchTerm);

  @override
  List<Object?> get props => [searchTerm];
}

class PatientSearchEvent extends PatientEvent {}

class PatientLoadEvent extends PatientEvent {
  @override
  List<Object?> get props => [];
}

class ChangePageEvent extends PatientEvent {
  final int selectedPage;

  ChangePageEvent(this.selectedPage);

  @override
  List<Object?> get props => [selectedPage];
}
