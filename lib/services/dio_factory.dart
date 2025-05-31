

import 'package:dio/dio.dart';
import 'package:frontend/services/interceptors/dio_error_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioFactory {
  static Future<Dio> create({bool withAuth = true}) async {
    final dio = Dio();

    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.interceptors.add(DioErrorInterceptor());

    if (withAuth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
        // dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0ZXIuc2VjcmV0YXJ5QGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ4NTM3NzQ2LCJleHAiOjE3NDg2NDU3NDZ9.hvkt1evplt31gMOUwNfIb4sY4KhBNPBESU6mslfjbQQ';
      }
    }

    return dio;
  }
}