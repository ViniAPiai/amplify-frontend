
import 'package:dio/dio.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/services/api_service.dart';

class UserService {
  
  static Future<UserModel> me() async {
    try{
      Response response = await ApiService.instance.getDioWithAuth()
          .get("/users/me");
      if(response.statusCode == 200){
        return UserModel.fromJson(response.data);
      }else{
        throw Exception("Error");
      }
    }catch(e) {
      throw Exception(e);
    }
  }

  static Future<UserModel> updateLanguage(String code) async {
    Response response = await ApiService.instance.getDioWithAuth().put('/users/language/$code',);
    if(response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    }
    throw Exception("Error");
  }
  
}