import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/consultation/appointment_interval_enum.dart';
import 'package:frontend/models/consultation/appointment_model.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/services/api_service.dart';

class AppointmentService {
  static Future<AppointmentModel> insert(AppointmentModel appointmentModel) async {
    try {
      print(json.encode(appointmentModel.toJsonForInsert()));
      Response response =
          await ApiService.instance.getDioWithAuth().post("/erp/appointment/clinic", data: json.encode(appointmentModel.toJsonForInsert()));
      if (response.statusCode == 200) {
        return AppointmentModel.fromJson(response.data);
      } else {
        throw Exception(response.data["detail"]);
      }
    } on DioException catch (e) {
      print(e);
      throw Exception(e.response!.data["detail"]);
    }
  }

  /*static Future<AppointmentModel> update(AppointmentModel consultationModel) async {
    Response response = await ApiService.instance.getDioWithAuth().put("/erp/appointment/clinic", data: {
      "uuid": consultationModel.uuid,
      "description": consultationModel.notes,
      "doctorUuid": consultationModel.doctor!.uuid,
      "nurseUuid": consultationModel.nurse?.uuid,
      "patientUuid": consultationModel.patient!.uuid,
      "startTime": consultationModel.startTime.toIso8601String(),
      "endTime": consultationModel.endTime.toIso8601String(),
    });
    if (response.statusCode == 200) {
      return AppointmentModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }*/

  static Future<AppointmentModel> findByUuid(String uuid) async {
    Response response = await ApiService.instance.getDioWithAuth().get("/erp/appointment/$uuid");
    if (response.statusCode == 200) {
      return AppointmentModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<List<AppointmentModel>> secretaryAgenda(AppointmentIntervalEnum consultationIntervalEnum, DateTime day) async {
    Response response = await ApiService.instance
        .getDioWithAuth()
        .post("/erp/appointment/clinic/agenda", data: json.encode({"interval": consultationIntervalEnum.value, "day": day.toIso8601String()}));
    if (response.statusCode == 200) {
      return (response.data as List<dynamic>).map((e) => AppointmentModel.fromJson(e)).toList();
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<AppointmentModel> confirm(String uuid) async {
    Response response = await ApiService.instance.getDioWithAuth().put("/erp/appointment/clinic/confirm/$uuid");
    if (response.statusCode == 200) {
      return AppointmentModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<MessageModel> delete(String uuid) async {
    Response response = await ApiService.instance.getDioWithAuth().delete("/erp/appointment/$uuid");
    if (response.statusCode == 200) {
      return MessageModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }
}
