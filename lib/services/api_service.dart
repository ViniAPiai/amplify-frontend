import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  String get baseUrl {
    return String.fromEnvironment("API_URL");
  }

  Dio getDioWithAuth() {
    Dio dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
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
  }

  Dio getDio() {
    return Dio(BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Header": "*"
        }));
  }
}
