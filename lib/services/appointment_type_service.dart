
import 'package:dio/dio.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';

import 'api_service.dart';

class AppointmentTypeService {

    static Future<List<AppointmentTypeModel>> getAppointmentTypes() async {
      try {
        Response response = await ApiService.instance.getDioWithAuth().get('/erp/appointment/type/all');
        if(response.statusCode == 200) {
          return (response.data as List).map((e) => AppointmentTypeModel.fromJson(e)).toList();
        }
        throw Exception("Error");
      }catch(e) {
        print(e);
        rethrow;
      }
    }

}