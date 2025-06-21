import 'package:dio/dio.dart';
import 'package:frontend/services/api_client.dart';
import 'package:frontend/services/api_service_factory.dart';

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

}
