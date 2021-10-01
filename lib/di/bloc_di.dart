import 'package:flutter_code_base/core/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

class BlocDI {
  BlocDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<MainBloc>(MainBloc());
  }
}
