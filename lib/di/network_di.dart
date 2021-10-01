import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:flutter_code_base/config/config.dart';

class NetWorkDI {
  NetWorkDI._();

  static Future<void> init(GetIt injector,
      {required BuildMode buildMode}) async {
    GetIt.instance.registerSingleton<NetWorkMode>(NetWorkMode(mode: buildMode));

    GetIt.instance.registerSingleton<CustomInterceptors>(CustomInterceptors());

    GetIt.instance.registerSingleton<Dio>(Dio(BaseOptions(
      baseUrl: injector<NetWorkMode>().baseUrl,
      connectTimeout: injector<NetWorkMode>().connectTimeout,
      receiveTimeout: injector<NetWorkMode>().receiveTimeout,
    ))
      ..interceptors.add(injector<CustomInterceptors>()));
  }
}
