
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/dentist_free_time/time_range.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';

enum PageControllerValue {next, previous, none}

class NewAppointmentState extends Equatable {

  final PageControllerValue pageController;
  final int page;
  final int maxPage;
  final double progress;
  final AppointmentModel model;
  final bool isRegistering;
  final bool isFinished;
  final bool isLoadingPatients;
  final List<UserModel> patients;
  final List<UserModel> filteredPatients;
  final bool isLoadingDoctors;
  final List<UserModel> doctors;
  final bool isLoadingNurses;
  final List<UserModel> nurses;
  final bool isLoadingProcedureTypes;
  final List<ProcedureTypeModel> filteredProcedureTypes;
  final List<ProcedureTypeModel> procedureTypes;
  final List<TimeRange> timeRanges;
  final bool isLoadingAppointmentTypes;
  final List<AppointmentTypeModel> appointmentTypes;
  final List<AppointmentTypeModel> filteredAppointmentTypes;
  final List<int> teethSelected;
  final bool isLoadingFreeTime;
  final bool success;
  final bool error;


  const NewAppointmentState({
      required this.model,
      this.pageController = PageControllerValue.none,
      this.page = 0,
      this.maxPage = 8,
      this.progress = 1 / 8,
      this.isRegistering = false,
      this.isFinished = false,
      this.isLoadingPatients = true,
      this.patients = const [],
      this.filteredPatients = const [],
      this.isLoadingDoctors = true,
      this.doctors = const [],
      this.isLoadingNurses = true,
      this.nurses = const [],
      this.isLoadingProcedureTypes = true,
      this.filteredProcedureTypes = const [],
      this.procedureTypes = const [],
      this.timeRanges = const [],
      this.isLoadingAppointmentTypes = true,
      this.appointmentTypes = const [],
      this.filteredAppointmentTypes = const [],
      this.teethSelected = const [],
      this.isLoadingFreeTime = false,
      this.success = false,
      this.error = false,
  });

  NewAppointmentState copyWith({
    PageControllerValue? pageController,
    int? page,
    int? maxPage,
    double? progress,
    AppointmentModel? model,
    bool? isRegistering,
    bool? isFinished,
    bool? isLoadingPatients,
    List<UserModel>? patients,
    List<UserModel>? filteredPatients,
    bool? isLoadingDoctors,
    List<UserModel>? doctors,
    bool? isLoadingNurses,
    List<UserModel>? nurses,
    bool? isLoadingProcedureTypes,
    List<ProcedureTypeModel>? filteredProcedureTypes,
    List<ProcedureTypeModel>? procedureTypes,
    List<TimeRange>? timeRanges,
    bool? isLoadingAppointmentTypes,
    List<AppointmentTypeModel>? appointmentTypes,
    List<AppointmentTypeModel>? filteredAppointmentTypes,
    List<int>? teethSelected,
    bool? isLoadingFreeTime,
    bool? success,
    bool? error,
  }) {
    return NewAppointmentState(
      pageController: pageController ?? this.pageController,
      model: model ?? this.model,
      page: page ?? this.page,
      maxPage: maxPage ?? this.maxPage,
      progress: progress ?? this.progress,
      isRegistering: isRegistering ?? this.isRegistering,
      isFinished: isFinished ?? this.isFinished,
      isLoadingPatients: isLoadingPatients ?? this.isLoadingPatients,
      patients: patients ?? this.patients,
      filteredPatients: filteredPatients ?? this.filteredPatients,
      isLoadingDoctors: isLoadingDoctors ?? this.isLoadingDoctors,
      doctors: doctors ?? this.doctors,
      isLoadingNurses: isLoadingNurses ?? this.isLoadingNurses,
      nurses: nurses ?? this.nurses,
      isLoadingProcedureTypes: isLoadingProcedureTypes ?? this.isLoadingProcedureTypes,
      filteredProcedureTypes: filteredProcedureTypes ?? this.filteredProcedureTypes,
      procedureTypes: procedureTypes ?? this.procedureTypes,
      timeRanges: timeRanges ?? this.timeRanges,
      isLoadingAppointmentTypes: isLoadingAppointmentTypes ?? this.isLoadingAppointmentTypes,
      appointmentTypes: appointmentTypes ?? this.appointmentTypes,
      filteredAppointmentTypes: filteredAppointmentTypes ?? this.filteredAppointmentTypes,
      teethSelected: teethSelected ?? this.teethSelected,
      isLoadingFreeTime: isLoadingFreeTime ?? this.isLoadingFreeTime,
      success: success ?? this.success,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    pageController,
    page,
    maxPage,
    progress,
    model,
    isRegistering,
    isFinished,
    isLoadingPatients,
    patients,
    filteredPatients,
    isLoadingDoctors,
    doctors,
    isLoadingNurses,
    nurses,
    isLoadingProcedureTypes,
    filteredProcedureTypes,
    procedureTypes,
    timeRanges,
    isLoadingAppointmentTypes,
    appointmentTypes,
    filteredAppointmentTypes,
    teethSelected,
    isLoadingFreeTime,
    success,
    error,
  ];

}