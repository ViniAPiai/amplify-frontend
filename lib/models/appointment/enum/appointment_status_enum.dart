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
  @JsonValue("ARRIVED")
  arrived("ARRIVED", AppColors.primary),
  @JsonValue("IN_PROGRESS")
  inProgress("IN_PROGRESS", Colors.deepPurpleAccent),
  @JsonValue("FINISHED")
  finished("FINISHED", AppColors.gray2),
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
        return AppointmentStatusEnum.arrived;
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
      case AppColors.primary:
        return AppointmentStatusEnum.arrived;
      case AppColors.gray2:
        return AppointmentStatusEnum.finished;
      case Colors.redAccent:
        return AppointmentStatusEnum.cancelled;
      case Colors.deepPurpleAccent:
        return AppointmentStatusEnum.inProgress;
      default:
        return AppointmentStatusEnum.waitingForClinicConfirmation;
    }
  }

  @override
  String toString() => name;
}
