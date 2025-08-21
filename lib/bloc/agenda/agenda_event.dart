import 'package:calendar_view/calendar_view.dart';
import 'package:equatable/equatable.dart';

enum AgendaAction {next, previous, set}
enum AgendaActionType {month, week, day, none}

abstract class AgendaEvent extends Equatable {
  const AgendaEvent();

  @override
  List<Object?> get props => [];
}

class LoadSelectedAgendaType extends AgendaEvent {}

class ToggleAgendaType extends AgendaEvent {
  final int selectedIndex;

  const ToggleAgendaType(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class LoadEventsByDate extends AgendaEvent {
  final DateTime date;

  const LoadEventsByDate(this.date);

  @override
  List<Object?> get props => [date];
}

class UpdateEvent extends AgendaEvent {
  final CalendarEventData currentEvent;
  final CalendarEventData newEvent;

  const UpdateEvent(this.currentEvent, this.newEvent);

  @override
  List<Object?> get props => [currentEvent, newEvent];
}

class NavigationChanged extends AgendaEvent {
  final AgendaActionType type;
  final AgendaAction action;
  final DateTime? date;

  const NavigationChanged(this.type, this.action, {this.date});

  @override
  List<Object?> get props => [type, action, date];
}

