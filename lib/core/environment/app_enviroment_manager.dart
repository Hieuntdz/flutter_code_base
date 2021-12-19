
import 'package:flutter_code_base/config/app_config.dart';

class AppEnvironmentManager {
  AppEnvironmentManager._();

  static final _instance = AppEnvironmentManager._();

  factory AppEnvironmentManager() => _instance;

  static initialize() {
    if (AppConfig().buildType == NetworkType.DEVELOPMENT) {
      baseUrl = 'DEV base url';
    } else if (AppConfig().buildType == NetworkType.STAGGING){
      baseUrl = 'STAGGING base url';
    }else{
      baseUrl = 'Product url';
    }
  }

  static late String baseUrl;
}
