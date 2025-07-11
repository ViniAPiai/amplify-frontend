
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        toastification.show(
          style: ToastificationStyle.minimal,
          type: ToastificationType.error,
          title: Text("Erro"),
          description: Text("Erro de conexão"),
        );
        break;
      case DioExceptionType.sendTimeout:
        print("Erro: Timeout no envio");
        break;
      case DioExceptionType.receiveTimeout:
        print("Erro: Timeout na resposta");
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode ?? 0;
        print("Erro do servidor: $statusCode");
        if (statusCode == 401) {
          print("Usuário não autorizado");
        }
        break;
      case DioExceptionType.cancel:
        print("Requisição cancelada");
        break;
      case DioExceptionType.unknown:
        print("Erro desconhecido: ${err.message}");
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
    handler.next(err);
  }
}