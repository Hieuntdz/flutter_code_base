import 'package:dio/dio.dart';
import 'package:flutter_code_base/core/environment/app_enviroment_manager.dart';
import 'package:flutter_code_base/core/services/http_intercepter_logging.dart';

class AppHttpClient {
  AppHttpClient._internal();

  static AppHttpClient shared = AppHttpClient._internal();

  static var connectTimeout = 45000;
  static var receiveTimeout = 30000;

  Dio? _dio;

  static Dio getDio() {
    shared._dio ??= createDio();
    return shared._dio!;
  }

  static Dio createDio() => Dio(
        BaseOptions(
          baseUrl: AppEnvironmentManager.baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          responseType: ResponseType.json,
          headers: {
            Headers.contentTypeHeader: 'application/json',
            // 'access_token': apiAccessToken,
          },
        ),
      )..interceptors.add(
          HttpInterceptorLogging(),
        );

  static void setSessionId(String? sessionId) {
    if (shared._dio != null) {
      shared._dio!.options.headers = {
        ...shared._dio!.options.headers,
        'session_id': sessionId ?? ''
      };
    }
  }
}
