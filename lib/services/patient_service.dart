import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/page_patient_response_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/user/user_model.dart';

import 'api_service.dart';

class PatientService {

  Future<String> insertByClinic(PatientModel patient) async {
    Response response = await ApiService.instance.getDioWithAuth().post('/erp/patient/insert_by_clinic', data: patient.toJson());
    if(response.statusCode == 200) {
      return response.data["message"];
    } else{
      throw Exception('Não conseguiu');
    }
  }

  Future<PatientModel> findById(String uuid) async {
    Response response = await ApiService.instance
        .getDioWithAuth()
        .get('/erp/patient/$uuid');
    if(response.statusCode == 200) {
      return PatientModel.fromJson(response.data);
    } else{
      throw Exception('Não conseguiu');
    }
  }

  Future<PagePatientResponseModel> pagination({String searchTerm = "", int page = 0}) async {
    Response response = await ApiService.instance.getDioWithAuth().post('/erp/patient/page/secretary', data: {"searchTerm": searchTerm, "page": page});
    if (response.statusCode == 200) {
      return PagePatientResponseModel.fromJson(response.data);
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<List<UserModel>> names({String searchTerm = "", int page = 0}) async {
    Response response = await ApiService.instance.getDioWithAuth().post('/erp/patient/names', data: {"searchTerm": searchTerm, "page": page});
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Não conseguiu');
    }
  }
}
