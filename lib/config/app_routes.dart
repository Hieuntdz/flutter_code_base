import 'package:flutter/material.dart';
import 'package:flutter_code_base/helper/image_helper/asset_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static PageTransition getRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        backgroundColor: Colors.white,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Không tìm thấy trang'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetHelper.splash),
                fit: BoxFit.cover,
              ),
            ),
          ),

        ),
        body:  Center(),
      );
    }
    return PageTransition(
        child: widget,
        type: PageTransitionType.rightToLeft,
        settings: settings);
  }
}
