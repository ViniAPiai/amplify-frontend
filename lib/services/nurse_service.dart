
import 'package:dio/dio.dart';
import 'package:frontend/models/user/user_model.dart';

import 'api_service.dart';

class NurseService {

  static Future<List<UserModel>> names() async {
    try {
      Response response = await ApiService.instance.getDioWithAuth().get('/erp/nurse/names');
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception(response.data['details']);
      }
    }on DioException catch (e) {
      throw Exception(e.response?.data['details']);
    }
  }

}