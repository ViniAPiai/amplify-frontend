

import 'package:dio/dio.dart';
import 'package:frontend/models/language/language.model.dart';
import 'package:frontend/services/api_service.dart';

class LanguageService {

  static Future<List<LanguageModel>> getLanguages() async {
    Response response = await ApiService.instance.getDioWithAuth().get('/erp/language');
    if(response.statusCode == 200) {
      return (response.data as List).map((e) => LanguageModel.fromJson(e)).toList();
    }
    throw Exception("Error");
  }

}