

import 'package:dio/dio.dart';
import 'package:frontend/services/api_service.dart';

class ClinicService {

    static Future<String> getCountry() async {
      Response response = await ApiService.instance.getDioWithAuth().get("/erp/clinic/country");
      if(response.statusCode == 200) {
        return response.data["country"];
      }else {
        throw Exception("Erro ao buscar países");
      }
    }

}