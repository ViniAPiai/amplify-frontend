import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class AuthService {
  static Future<bool> signIn(AuthRequestModel model) async {
        try {
            Response response = await ApiService.instance
                .getDio().post('/auth/sign_in', data: jsonEncode(model.toJson()));
            if(response.statusCode == 200) {
                AuthResponseModel model = AuthResponseModel
                    .fromJson(response.data);
                print("aquiii");
                print(model.toJson());
                final SharedPreferences shared = await SharedPreferences.getInstance();
                shared.setString("auth_token", model.token);
                shared.setString("expiresIn", model.expiresIn.toIso8601String());
                return true;
            }else{
                throw Exception('dgkmtkmtkmtkm');
            }
        }catch(e) {
            print(e);
            throw Exception('Não conseguiu');
        }

    }

  /*static void signIn2() async {
    try {
      // String url = "http://144.126.227.199:8080/api/auth/sign_in";
      String url = "http://localhost:8080/api/auth/sign_in";
      var response = await post(Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          body: jsonEncode(
              AuthRequestModel("vinicius-piai@hotmail.com", "V!nicius99")
                  .toJson()));
      if (response.statusCode == 200) {
        AuthResponseModel model =
            AuthResponseModel.fromJson(jsonDecode(response.body));
        print("aqiii");
        print(model.toJson());
        final SharedPreferences shared = await SharedPreferences.getInstance();
        shared.setString("auth_token", model.token);
        shared.setString("expiresIn", model.expiresIn.toIso8601String());
      } else {
        throw Exception("Erro");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static void test() async {
    try {
      // String url = "http://144.126.227.199:8080/test";
      String url = "http://localhost:8080/";
      var response = await get(
        Uri.parse(url),
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("error");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static void me2() async {
    try {
      // String url = "http://144.126.227.199:8080/test";
      String url = "http://localhost:8080/api/users/me";
      var response = await get(
        Uri.parse(url),
        headers: {
          "Authorization":
              "Bearer ${(await SharedPreferences.getInstance()).getString("auth_token")}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }*/
}
