import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class AuthService {

  static Future<bool> signIn(AuthRequestModel model, BuildContext context) async {
    try {
      Response response = await ApiService.instance
          .getDio()
          .post('/auth/sign_in', data: jsonEncode(model.toJson()));
      if (response.statusCode == 200) {
        AuthResponseModel model = AuthResponseModel.fromJson(response.data);
        final SharedPreferences shared = await SharedPreferences.getInstance();
        shared.setString("auth_token", model.token);
        shared.setString("expiresIn", model.expiresIn.toIso8601String());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Não conseguiu');
    }
  }

}
