
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:frontend/services/api_service.dart';
import 'package:http/http.dart' as http;

class AuthService {

    static void signIn(AuthRequestModel model) async {
        try {
            /*Response<AuthResponseModel> response = await ApiService.instance
                .getDio().post('/auth/sign_in', data: model.toJson());
            if(response.statusCode == 200) {
                print('dawdawdawdawd');
            }else{
                throw Exception('dgkmtkmtkmtkm');
            }*/
            final response = await http.post(
                Uri.http('192.168.0.176:8080', '/api/auth/sign_in'),
                body: jsonEncode(model.toJson()),
                headers: {
                    'Content-Type': 'application/json'
                }
            );
            if(response.statusCode == 200) {
                print("dawwdawd");
            }else {
                print("glthgtkg");
            }
        }catch(e) {
            print(e);
            throw Exception('Não conseguiu');
        }

    }

}