import 'package:equatable/equatable.dart';

abstract class SideBarEvent extends Equatable {
  const SideBarEvent();

  @override
  List<Object?> get props => [];
}

class OpenSideBar extends SideBarEvent {}

class CloseSideBar extends SideBarEvent {}

class ToggleNewAppointmentModal extends SideBarEvent {
  final DateTime? date;
  final String uuid;

  const ToggleNewAppointmentModal({this.date, this.uuid = ''});

  @override
  List<Object?> get props => [date, uuid];
}

class ToggleAppointmentDetailsModal extends SideBarEvent {
  final String uuid;

  const ToggleAppointmentDetailsModal({this.uuid = ''});

  @override
  List<Object?> get props => [uuid];
}

class ToggleClinicalExamModal extends SideBarEvent {}

class OpenEditAppointmentModal extends SideBarEvent {
  final String uuid;

  const OpenEditAppointmentModal(this.uuid);

  @override
  List<Object?> get props => [uuid];
}
