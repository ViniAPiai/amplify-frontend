import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/dentist_free_time/dentist_free_time_response.dart';
import 'package:frontend/models/user/user_model.dart';

import 'api_service.dart';

class DentistService {
  static Future<List<UserModel>> names() async {
    Response response = await ApiService.instance.getDioWithAuth().get('/erp/dentist/names');
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Não conseguiu');
    }
  }

  static Future<DentistFreeTimeResponse> freeTime(String uuid, DateTime date, List<String> procedureTypeUuids) async {
    try {
      Response response = await ApiService.instance
          .getDioWithAuth()
          .post('/erp/dentist/$uuid/free-time', data: json.encode({"date": date.toIso8601String(), "procedureTypeUuids": procedureTypeUuids}));
      if (response.statusCode == 200) {
        return DentistFreeTimeResponse.fromJson(response.data);
      }
      throw Exception(response.data['details']);
    } on DioException catch (e) {
      throw Exception(e.response!.data['details']);
    }
  }
}
