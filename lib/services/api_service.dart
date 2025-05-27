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
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0ZXIuc2VjcmV0YXJ5QGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ4MzczMDQ0LCJleHAiOjE3NDg0ODEwNDR9.wQqxXjtFn8es7mFoF3JHbiL2xsQBiW-eYTN9L1NLu80"
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
