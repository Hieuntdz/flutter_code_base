import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/environment/app_enviroment_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_code_base/di/injector.dart';

enum NetworkType { DEVELOPMENT, STAGGING, PRODUCT }

class AppConfig {
  static final AppConfig _appConfig = AppConfig._();

  factory AppConfig() {
    return _appConfig;
  }

  AppConfig._();

  var buildType = NetworkType.DEVELOPMENT;

  var IS_SHOW_LOG = true;

  Future<void> configApp() async {
    // Init app environment
    AppEnvironmentManager.initialize();

    // Init GetIt dependencies
    await AppInjector.initializeDependencies();

    // Init easyLoading
    configLoading();
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = AppColors.whiteColor
      ..indicatorSize = 40.0
      ..radius = 12.0
      ..backgroundColor = AppColors.blackColor.withOpacity(0.8)
      ..indicatorColor = AppColors.whiteColor
      ..maskColor = AppColors.blackColor.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
