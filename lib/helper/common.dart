import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_code_base/config/config.dart';
import 'package:flutter_code_base/core/services/http_client.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

StreamSubscription? showLoadingTimeout;

void showLoading({
  String? status,
  Widget? indicator,
  bool? dismissOnTap,
  EasyLoadingMaskType? maskType = EasyLoadingMaskType.clear,
}) {
  if (EasyLoading.isShow) {
    return;
  }
  EasyLoading.instance.backgroundColor = Colors.black54;
  EasyLoading.show(
      status: status,
      indicator: indicator,
      dismissOnTap: dismissOnTap,
      maskType: maskType);
  if (showLoadingTimeout != null) {
    clearTimeout(showLoadingTimeout!);
    showLoadingTimeout = null;
  }
  showLoadingTimeout = setTimeout(() {
    hideLoading();
  }, AppHttpClient.connectTimeout);
}

void hideLoading() {
  if (showLoadingTimeout != null) {
    clearTimeout(showLoadingTimeout!);
    showLoadingTimeout = null;
  }
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}

StreamSubscription setTimeout(Function callback, int milliseconds) {
  final future = Future.delayed(Duration(milliseconds: milliseconds));
  return future.asStream().listen((event) {}, onDone: () {
    callback();
  });
}

void clearTimeout(StreamSubscription subscription) {
  try {
    subscription.cancel();
  } catch (e) {
    Logger.e(e);
  }
}
