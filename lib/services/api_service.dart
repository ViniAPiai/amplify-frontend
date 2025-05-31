import 'package:dio/dio.dart';
import 'package:frontend/services/api_client.dart';
import 'package:frontend/services/api_service_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {

  late final ApiClient _client;

  ApiService._(this._client);

  static Future<ApiService> create({bool withAuth = true}) async {
    final client = withAuth
        ? await ApiServiceFactory.authorized()
        : await ApiServiceFactory.unauthorized();
    return ApiService._(client);
  }

  ApiClient get client => _client;

  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();
  static const apiUrl = String.fromEnvironment("API_URL");

  Dio getDioWithAuth() {
    return Dio()..options = BaseOptions(
      baseUrl: apiUrl,
      contentType: Headers.jsonContentType,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Header": "*",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0ZXIuc2VjcmV0YXJ5QGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ4NTM3NzQ2LCJleHAiOjE3NDg2NDU3NDZ9.hvkt1evplt31gMOUwNfIb4sY4KhBNPBESU6mslfjbQQ"
      }
    );
  }

}
