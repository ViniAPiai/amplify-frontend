import 'package:calendar_view/calendar_view.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/bloc/agenda/agenda_event.dart';

class AgendaState extends Equatable {
  final EventController controller;
  final CalendarEventData? currentEvent;
  final int selectedIndex;
  final bool isLoadingAppointments;
  final bool isLoaded;
  final bool showBarrier;
  final bool isEditing;
  final bool isFinished;
  final DateTime? lastLoadedMonth;
  final AgendaAction action;
  final AgendaActionType type;
  final DateTime? date;

  const AgendaState({
    required this.controller,
    required this.currentEvent,
    required this.lastLoadedMonth,
    this.selectedIndex = 2,
    this.isLoadingAppointments = true,
    this.isLoaded = true,
    this.showBarrier = false,
    this.isEditing = false,
    this.isFinished = false,
    this.action = AgendaAction.next,
    this.type = AgendaActionType.none,
    this.date,
  });

  AgendaState copyWith({
    EventController? controller,
    CalendarEventData? currentEvent,
    int? selectedIndex,
    bool? isLoadingAppointments,
    bool? isLoaded,
    bool? showBarrier,
    bool? isEditing,
    bool? isFinished,
    DateTime? lastLoadedMonth,
    AgendaAction? action,
    AgendaActionType? type,
    DateTime? date,
  }) {
    return AgendaState(
      controller: controller ?? this.controller,
      currentEvent: currentEvent ?? this.currentEvent,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoadingAppointments: isLoadingAppointments ?? this.isLoadingAppointments,
      isLoaded: isLoaded ?? this.isLoaded,
      showBarrier: showBarrier ?? this.showBarrier,
      isEditing: isEditing ?? this.isEditing,
      isFinished: isFinished ?? this.isFinished,
      lastLoadedMonth: lastLoadedMonth ?? this.lastLoadedMonth,
      action: action ?? this.action,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        controller,
        currentEvent,
        selectedIndex,
        isLoadingAppointments,
        isLoaded,
        showBarrier,
        isEditing,
        isFinished,
        lastLoadedMonth,
        action,
        type,
        date
      ];
}
