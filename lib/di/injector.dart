import 'package:flutter_code_base/di/page_di.dart';
import 'package:get_it/get_it.dart';
import 'repository_di.dart';
import 'bloc_di.dart';

class AppInjector {
  AppInjector._();

  static final injector = GetIt.instance;

  static Future<void> initializeDependencies() async {
    await RepositoryDI.init(injector);
    await BlocDI.init(injector);
    await PageDI.init(injector);
  }
}
