import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:json_annotation/json_annotation.dart';

enum AppointmentStatusEnum {
  @JsonValue("WAITING_FOR_CLINIC_CONFIRMATION")
  waitingForClinicConfirmation(
    "WAITING_FOR_CLINIC_CONFIRMATION",
    Colors.amber,
  ),
  @JsonValue("SCHEDULED")
  scheduled("SCHEDULED", Colors.blue),
  @JsonValue("PATIENT_IN_THE_CLINIC")
  patientInTheClinic("PATIENT_IN_THE_CLINIC", Colors.grey),
  @JsonValue("FINISHED")
  finished("FINISHED", AppColors.secondary),
  @JsonValue("CANCELLED")
  cancelled("CANCELLED", Colors.redAccent);

  final String name;
  final Color color;

  const AppointmentStatusEnum(this.name, this.color);

  static AppointmentStatusEnum fromString(String status) {
    switch (status) {
      case "WAITING_FOR_CLINIC_CONFIRMATION":
        return AppointmentStatusEnum.waitingForClinicConfirmation;
      case "SCHEDULED":
        return AppointmentStatusEnum.scheduled;
      case "PATIENT_IN_THE_CLINIC":
        return AppointmentStatusEnum.patientInTheClinic;
      case "FINISHED":
        return AppointmentStatusEnum.finished;
      case "CANCELLED":
        return AppointmentStatusEnum.cancelled;
      default:
        return AppointmentStatusEnum.waitingForClinicConfirmation;
    }
  }

  static AppointmentStatusEnum fromColor(Color color) {
    switch (color) {
      case Colors.amber:
        return AppointmentStatusEnum.waitingForClinicConfirmation;
      case Colors.blue:
        return AppointmentStatusEnum.scheduled;
      case Colors.grey:
        return AppointmentStatusEnum.patientInTheClinic;
      case AppColors.secondary:
        return AppointmentStatusEnum.finished;
      case Colors.redAccent:
        return AppointmentStatusEnum.cancelled;
      default:
        return AppointmentStatusEnum.waitingForClinicConfirmation;
    }
  }

  @override
  String toString() => name;
}
