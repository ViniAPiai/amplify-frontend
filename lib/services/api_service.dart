import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/services/interceptors/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  String get baseUrl {
    if (kDebugMode) {
      return 'http://localhost:8080/api';
    }

    return 'http://localhost:8080/api';
  }

  Dio getDioWithAuth() {
    Dio dio = Dio()
      ..options = BaseOptions(baseUrl: baseUrl,)
      ..interceptors.add(AuthInterceptor());
    print(dio.options.headers);
    return dio;
  }

  Dio getDio() {
    return Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Content-Type, Authorization',
          }),
    );
  }
}
