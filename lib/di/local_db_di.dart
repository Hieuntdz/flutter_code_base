import 'package:get_it/get_it.dart';

import 'package:flutter_code_base/data/local_db/app_database/app_database.dart';
import 'package:flutter_code_base/data/local_db/daos/daos.dart';

class LocalDbDI {
  LocalDbDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<AppDB>(AppDB());
    await injector<AppDB>().initAppDB().then((_) => {
          injector.registerSingleton<AppUserDao>(
              injector<AppDB>().database.appUserDao)
        });
  }
}
