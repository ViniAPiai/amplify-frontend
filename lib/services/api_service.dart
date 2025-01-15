
import 'package:dio/dio.dart';

class ApiService {

    Dio getDio() {
        Dio dio = Dio();
        dio.options = BaseOptions(
          baseUrl: 'http://localhost:8080/api',
          connectTimeout: Duration(seconds: 5),

        );
        return dio;
    }

}