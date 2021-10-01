import 'package:flutter_code_base/di/page_di.dart';
import 'package:get_it/get_it.dart';

import '../config/network_config.dart';
import 'api_di.dart';
import 'bloc_di.dart';
import 'local_db_di.dart';
import 'network_di.dart';
import 'service_di.dart';

class AppInjector {
  AppInjector._();

  static final injector = GetIt.instance;

  static Future<void> initializeDependencies(
      {required BuildMode buildMode}) async {
    await NetWorkDI.init(injector, buildMode: buildMode);
    await ApiDI.init(injector);
    await ServiceDI.init(injector);
    await BlocDI.init(injector);
    await LocalDbDI.init(injector);
    await PageDI.init(injector);
  }
}
