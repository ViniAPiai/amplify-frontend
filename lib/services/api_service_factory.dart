
import 'package:frontend/services/api_client.dart';
import 'package:frontend/services/dio_factory.dart';

class ApiServiceFactory {
  static Future<ApiClient> authorized() async {
    final dio = await DioFactory.create(withAuth: true);
    return ApiClient(dio);
  }

  static Future<ApiClient> unauthorized() async {
    final dio = await DioFactory.create(withAuth: false);
    return ApiClient(dio);
  }
}