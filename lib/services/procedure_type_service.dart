
import 'package:dio/dio.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';

import 'api_service.dart';

class ProcedureTypeService {

    static Future<List<ProcedureTypeModel>> getProcedureTypes() async {
      Response response = await ApiService.instance.getDioWithAuth().get('/erp/procedure/type/all');
      if(response.statusCode == 200) {
        return (response.data as List).map((e) => ProcedureTypeModel.fromJson(e)).toList();
      }
      throw Exception("Error");
    }

}