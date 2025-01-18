
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    if(shared.containsKey("token")) {
      String? token = shared.getString("token");
      DateTime expiresIn = DateTime.parse(shared.getString("expiresIn")!);
      if(DateTime.now().isBefore(expiresIn)) {
        options.contentType = Headers.jsonContentType;
        options.headers["Authorization"] = 'Bearer $token';
        options.headers['Access-Control-Allow-Origin'] = '*';
        options.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS';
        options.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization';
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
      return super.onResponse(response, handler);
  }
}