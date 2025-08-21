import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_event.dart';
import 'package:frontend/bloc/agenda/agenda_state.dart';
import 'package:frontend/models/agenda_request.model.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/enum/appointment_interval_enum.dart';
import 'package:frontend/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc() : super(AgendaState(controller: EventController(), lastLoadedMonth: DateTime.now(), currentEvent: null)) {
    on<LoadSelectedAgendaType>(_onLoadSelectedAgendaType);
    on<ToggleAgendaType>(_onToggleAgendaType);
    on<LoadEventsByDate>(_onLoadEventsByDate);
    on<UpdateEvent>(_onUpdateEvent);
    on<NavigationChanged>(_onNavigationChanged);
  }

  void _onLoadSelectedAgendaType(LoadSelectedAgendaType event, Emitter<AgendaState> emit) {
    SharedPreferences.getInstance().then((prefs) {
      emit(state.copyWith(selectedIndex: prefs.getInt("agenda_selected_type") ?? 2));
    });
  }

  void _onToggleAgendaType(ToggleAgendaType event, Emitter<AgendaState> emit) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt("agenda_selected_type", event.selectedIndex);
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    });
  }

  void _onLoadEventsByDate(LoadEventsByDate event, Emitter<AgendaState> emit) async {
    emit(state.copyWith(isLoadingAppointments: true));
    /*if (state.lastLoadedMonth != null &&
        state.lastLoadedMonth!.day == event.date.day &&
        state.lastLoadedMonth!.month == event.date.month &&
        state.lastLoadedMonth!.year == event.date.year) {
      emit(state.copyWith(isLoadingAppointments: false));
      return;
    }*/
    state.controller.removeWhere((event) => true,);
    AppointmentIntervalEnum interval = AppointmentIntervalEnum.values[state.selectedIndex];
    List<AppointmentModel> consultations =
    await (await ApiService.create()).client.secretaryAgenda(AgendaRequestModel(interval: interval, day: event.date));
    List<CalendarEventData> events = consultations
        .map(
          (e) => CalendarEventData(
          title: e.patient!.fullName,
          date: e.date,
          startTime: DateTime(e.date.year, e.date.month, e.date.day, e.startTime.hour, e.startTime.minute),
          endTime: DateTime(e.date.year, e.date.month, e.date.day, e.endTime.hour, e.endTime.minute),
          endDate: e.date,
          color: e.status!.color,
          description: e.notes,
          event: e),
    )
        .toList();
    EventController controller = EventController();
    controller.addAll(events);
    emit(state.copyWith(isLoadingAppointments: false, lastLoadedMonth: event.date, controller: controller));
  }

  void _onUpdateEvent(UpdateEvent event, Emitter<AgendaState> emit) {
    state.controller.update(event.currentEvent, event.newEvent);
    emit(state.copyWith());
  }

  void _onNavigationChanged(NavigationChanged event, Emitter<AgendaState> emit) {
    emit(state.copyWith(action: event.action, type: event.type, date: event.date));
    emit(state.copyWith(action: event.action, type: AgendaActionType.none, date: event.date));
  }
}
