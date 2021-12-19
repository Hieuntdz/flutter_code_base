import 'package:dio/dio.dart';
import 'package:flutter_code_base/config/logger.dart';

class HttpInterceptorLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.i('*** Request ***\nREQUEST[${options.method}] => ${options.uri}', logToFile: true);
    if (options.method == 'POST' || options.method == 'PUT') {
      Logger.i('*** PARAMS ***\n' + options.data.toString(), logToFile: true);
    }
    if (options.method == 'GET') {
      Logger.i('*** PARAMS ***\n' + options.queryParameters.toString(), logToFile: true);
    }
    Logger.i('*** HEADERS ***\n' + options.headers.toString(), logToFile: true);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.i(
        '*** Response ***\nRESPONSE[${response.statusCode}] => ${response.realUri}\n${response.data.toString()}',
        logToFile: true);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.i(
        '*** Error ***\nERROR[${err.response?.data?['code'] ?? err.response?.statusCode}] => ${err.requestOptions.uri} WITH MESSAGE: ${err.response?.data?['message'] ?? err.message}',
        logToFile: true);
    return super.onError(err, handler);
  }
}
