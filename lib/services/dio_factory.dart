

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/services/interceptors/dio_error_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioFactory {
  static Future<Dio> create({bool withAuth = true}) async {
    final dio = Dio();
    dio.options.baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:8080';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.interceptors.add(DioErrorInterceptor());
    dio.options.headers['Content-Type'] = 'application/json';

    if (withAuth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return dio;
  }
}