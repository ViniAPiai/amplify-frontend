import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  String get baseUrl {
    String local = 'http://localhost:8080/api';
    String localIp = 'http://192.168.0.176:8080/api';
    String prod = 'http://144.126.227.199:8080/api';

    return local;
  }

  Dio getDioWithAuth() {
    /*Dio dio = Dio()
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
      ));*/
    Dio dio = Dio()
      ..options = BaseOptions(baseUrl: baseUrl, contentType: "application/json",
          headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0ZXIuc2VjcmV0YXJ5QGV4YW1wbGUuY29tIiwiaWF0IjoxNzQzODIyMTk0LCJleHAiOjE3NDM5MzAxOTR9.5ztfDV3imzuB3ilURuZ9na8k3R1RUG0k8enuYSPiQ5o"});
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
