import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_code_base/di/injector.dart';
import '../constants/constants.dart';
import 'network_config.dart';

enum BuildType { DEVELOPMENT, STAGGING, PRODUCT }

class AppConfig {
  static final AppConfig _appConfig = AppConfig._();

  factory AppConfig() {
    return _appConfig;
  }

  AppConfig._();

  static var buildType = BuildType.DEVELOPMENT;

  Future<void> configApp() async {
    await AppInjector.initializeDependencies(buildMode: BuildMode.dev);
    configLoading();
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = ColorConstatns.whiteColor
      ..indicatorSize = 40.0
      ..radius = 12.0
      ..backgroundColor = ColorConstatns.blackColor.withOpacity(0.8)
      ..indicatorColor = ColorConstatns.whiteColor
      ..maskColor = ColorConstatns.blackColor.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
