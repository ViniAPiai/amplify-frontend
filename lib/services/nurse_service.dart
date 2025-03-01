
import 'package:dio/dio.dart';
import 'package:frontend/models/user/user_model.dart';

import 'api_service.dart';

class NurseService {

  static Future<List<UserModel>> names() async {
    Response response = await ApiService.instance.getDioWithAuth().get('/erp/nurse/names');
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Não conseguiu');
    }
  }

}