
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:frontend/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

    static Future<bool> signIn(AuthRequestModel model) async {
        try {
            Response response = await ApiService.instance
                .getDio().post('/auth/sign_in', data: jsonEncode(model.toJson()));
            if(response.statusCode == 200) {
                AuthResponseModel model = AuthResponseModel
                    .fromJson(response.data);
                print("aqiii");
                final SharedPreferences shared = await SharedPreferences.getInstance();
                shared.setString("token", model.token);
                shared.setString("expiresIn", model.expiresIn.toIso8601String());
                return true;
            }else{
                throw Exception('dgkmtkmtkmtkm');
            }
        }catch(e) {
            throw Exception('Não conseguiu');
        }

    }

}