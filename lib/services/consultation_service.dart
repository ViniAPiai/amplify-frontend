

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/consultation/consultation_interval_enum.dart';
import 'package:frontend/models/consultation/consultation_model.dart';
import 'package:frontend/models/message/message_model.dart';
import 'package:frontend/services/api_service.dart';

class ConsultationService {

  static Future<ConsultationModel> insert(ConsultationModel consultationModel) async {
    Response response = await ApiService.instance.getDioWithAuth().post("/erp/consultation/clinic", data: {
      "description": consultationModel.description,
      "doctorUuid": consultationModel.doctor!.uuid,
      "nurseUuid": consultationModel.nurse?.uuid,
      "patientUuid": consultationModel.patient!.uuid,
      "startTime": consultationModel.startTime.toIso8601String(),
      "endTime": consultationModel.endTime.toIso8601String(),
    });
    if (response.statusCode == 200) {
      return ConsultationModel.fromJson(response.data);
    } else {
      throw Exception(response.data["detail"]);
    }
  }

  static Future<ConsultationModel> update(ConsultationModel consultationModel) async {
    Response response = await ApiService.instance.getDioWithAuth().put("/erp/consultation/clinic", data: {
      "uuid": consultationModel.uuid,
      "description": consultationModel.description,
      "doctorUuid": consultationModel.doctor!.uuid,
      "nurseUuid": consultationModel.nurse?.uuid,
      "patientUuid": consultationModel.patient!.uuid,
      "startTime": consultationModel.startTime.toIso8601String(),
      "endTime": consultationModel.endTime.toIso8601String(),
    });
    if (response.statusCode == 200) {
      return ConsultationModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<ConsultationModel> findByUuid(String uuid) async {
    Response response = await ApiService.instance.getDioWithAuth().get("/erp/consultation/$uuid");
    if (response.statusCode == 200) {
      return ConsultationModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<List<ConsultationModel>> secretaryAgenda(ConsultationIntervalEnum consultationIntervalEnum, DateTime day) async {
    Response response = await ApiService.instance.getDioWithAuth().post("/erp/consultation/clinic/agenda", data:
        json.encode({"interval": consultationIntervalEnum.value, "day": day.toIso8601String()}));
    if (response.statusCode == 200) {
      return (response.data as List<dynamic>).map((e) => ConsultationModel.fromJson(e)).toList();
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<ConsultationModel> confirm(String uuid) async {
    Response response = await ApiService.instance.getDioWithAuth().put("/erp/consultation/clinic/confirm/$uuid");
    if (response.statusCode == 200) {
      return ConsultationModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<MessageModel> delete(String uuid) async {
    Response response = await ApiService.instance.getDioWithAuth().delete("/erp/consultation/$uuid");
    if (response.statusCode == 200) {
      return MessageModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

}