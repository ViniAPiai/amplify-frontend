import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:json_annotation/json_annotation.dart';

enum ConsultationStatusEnum {
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

  const ConsultationStatusEnum(this.name, this.color);

  static ConsultationStatusEnum fromString(String status) {
    switch (status) {
      case "WAITING_FOR_CLINIC_CONFIRMATION":
        return ConsultationStatusEnum.waitingForClinicConfirmation;
      case "SCHEDULED":
        return ConsultationStatusEnum.scheduled;
      case "PATIENT_IN_THE_CLINIC":
        return ConsultationStatusEnum.patientInTheClinic;
      case "FINISHED":
        return ConsultationStatusEnum.finished;
      case "CANCELLED":
        return ConsultationStatusEnum.cancelled;
      default:
        return ConsultationStatusEnum.waitingForClinicConfirmation;
    }
  }

  static ConsultationStatusEnum fromColor(Color color) {
    switch (color) {
      case Colors.amber:
        return ConsultationStatusEnum.waitingForClinicConfirmation;
      case Colors.blue:
        return ConsultationStatusEnum.scheduled;
      case Colors.grey:
        return ConsultationStatusEnum.patientInTheClinic;
      case AppColors.secondary:
        return ConsultationStatusEnum.finished;
      case Colors.redAccent:
        return ConsultationStatusEnum.cancelled;
      default:
        return ConsultationStatusEnum.waitingForClinicConfirmation;
    }
  }

  @override
  String toString() => name;
}
