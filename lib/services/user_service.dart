
import 'package:dio/dio.dart';
import 'package:frontend/services/api_service.dart';

class UserService {
  
  static void me() async {
    try{
      Response response = await ApiService.instance.getDioWithAuth()
          .get("/users/me");
      if(response.statusCode == 200){
        print(response);
      }else{
        print("kdawkdmkawmdkwa");
      }
    }catch(e) {
      print(e);
      throw Exception("uiiiiii");
    }
  }
  
}