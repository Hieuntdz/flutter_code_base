import 'package:flutter_code_base/data/services/services.dart';
import 'package:get_it/get_it.dart';

class ServiceDI {
  ServiceDI._();

  static Future<void> init(GetIt injector) async{
    injector.registerSingleton<UserSevice>(UserSevice(injector()));
  }
}
