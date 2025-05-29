import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();
  static const apiUrl = String.fromEnvironment("API_URL");

  /*Dio getDioWithAuth() {
    Dio dio = Dio()
      ..options = BaseOptions(
        baseUrl: apiUrl,
      )
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ));
    return dio;
  }*/

  Dio getDioWithAuth() {
    return Dio()..options = BaseOptions(
      baseUrl: apiUrl,
      contentType: Headers.jsonContentType,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Header": "*",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0ZXIuc2VjcmV0YXJ5QGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ4NDg3MjY0LCJleHAiOjE3NDg1OTUyNjR9.Jrt_EE-Z_7bwM9PpsmF_iRYf_H13K0oYm0ILaUnzHV8"
      }
    );
  }

  Dio getDio() {
    return Dio(BaseOptions(
        baseUrl: apiUrl,
        contentType: Headers.jsonContentType,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Header": "*"
        }));
  }
}
