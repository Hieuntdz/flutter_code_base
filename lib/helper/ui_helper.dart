import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UiHelper {
  UiHelper._();

  static void requestFocusScope(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  static void unFocusScope(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> showMyDialog(
      {required BuildContext context,
      String title = "Alert",
      required String content,
      Function? onPress}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                onPress?.call();
              },
            ),
          ],
        );
      },
    );
  }
}

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
  EasyLoading.show(status: status, indicator: indicator, dismissOnTap: dismissOnTap, maskType: maskType);
  if (showLoadingTimeout != null) {
    clearTimeout(showLoadingTimeout!);
    showLoadingTimeout = null;
  }
  showLoadingTimeout = setTimeout(() {
    hideLoading();
  }, 40000);
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
    print(e);
  }
}
