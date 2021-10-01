import 'package:flutter/material.dart';
import 'package:flutter_code_base/constants/routes.dart';
import 'package:flutter_code_base/presentation/screens/main_screen.dart';
import 'package:flutter_code_base/presentation/screens/screens.dart';
import 'package:get_it/get_it.dart';


class PageDI {
  PageDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<Widget>(() => const HomeScreen(),
        instanceName: RouteConstants.home);

    injector.registerFactory<Widget>(() => const SplashScreen(),
        instanceName: RouteConstants.splash);
  }
}
