import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_base/config/config.dart';
import 'package:flutter_code_base/di/injector.dart';
import '../../../config/logger.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    AppInjector.injector<CustomInterceptors>().onErrorStream.listen((err) {
      // Check status for logout
      logi.d(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}');
    });
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppNavigateEvent) {
      if (event.data == null) return;
      yield await _mapNavigateToState(event);
    }
    if (event is UserLogoutEvent) {
      yield UserLogoutState();
    }
  }

  Future<AppNavigateState> _mapNavigateToState(AppNavigateEvent event) async {
    final _data = event.data;
    return AppNavigateState(_data);
  }
}
