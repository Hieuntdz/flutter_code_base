import 'package:flutter/material.dart';

class RouteConstants {
  static const String splash = '/splash';
  static const String home = "/home";
  static const String api = "/api";
  static const String cached = "/cached";
  static const String detail = "/detail";
}

Future<void> pushReplacementNamed(BuildContext context, String name,
    {Object? arguments, bool animation = true, bool async = false}) async {
  Navigator.of(context).pushReplacementNamed(name);
}

Future<void> pushNamed(BuildContext context, String name,
    {Object? arguments, bool animation = true, bool async = false}) async {
  Navigator.of(context).pushNamed(name);
}

T? getArguments<T>(BuildContext context) {
  if (ModalRoute.of(context)!.settings.arguments != null &&
      ModalRoute.of(context)!.settings.arguments is T) {
    final args = ModalRoute.of(context)!.settings.arguments as T;
    return args;
  }
  return null;
}
