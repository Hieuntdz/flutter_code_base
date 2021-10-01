import 'package:flutter/material.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get italic {
    return copyWith(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic);
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get semiBold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get semiBoldDisable {
    return copyWith(fontWeight: FontWeight.w600, color: Colors.black38);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

class TextStyles {
  static const double _height = 1.4;

  static const TextStyle _defaultStyle = TextStyle(
    fontSize: 14,
    color: Color.fromRGBO(102, 102, 103, 1.0),
    height: _height,
  );

  /// Text use for normal OTP number
  ///
  /// Default: size: 24, weight: medium
  static TextStyle otpText1 = _defaultStyle.copyWith(fontSize: 24).medium;

  /// Text use for Smart OTP number
  ///
  /// Default: size: 35, weight: medium
  static TextStyle otpText2 = _defaultStyle.copyWith(fontSize: 35).medium;

  /// Text use for coundown timer at normal OTP view
  ///
  /// Default: size: 30, weight: regular
  static TextStyle countdownText1 =
      _defaultStyle.copyWith(fontSize: 30).regular;

  /// Text use for coundown timer at smart OTP view
  ///
  /// Default: size: 22, weight: regular
  static TextStyle countdownText2 =
      _defaultStyle.copyWith(fontSize: 22).regular;

  /// Text use for heading text
  ///
  /// Default: size: 20, weight: bold
  static TextStyle headingText = _defaultStyle.copyWith(fontSize: 20).bold;

  /// Text use for big button, button in card, navbar title, header of list, loading text, ...
  ///
  /// Default: size: 16, weight: semibold
  static TextStyle headerText = _defaultStyle.copyWith(fontSize: 16).semiBold;

  /// Text use for big button, button in card, navbar title, header of list, loading text, ...
  ///
  /// Default: size: 13, weight: semibold
  static TextStyle semiBoldText = _defaultStyle.copyWith(fontSize: 13).semiBold;

  /// Text use for regular button
  ///
  /// Default: size: 15, weight: regular
  static TextStyle buttonText = _defaultStyle.copyWith(fontSize: 15).regular;

  /// Text use for normal text in project
  ///
  /// Default: size: 14, weight: regular
  static TextStyle normalText = _defaultStyle.regular;

  /// Text use for item's title text like: bottom bar, header items, ...
  ///
  /// Default: size: 13, weight: regular
  static TextStyle itemText = _defaultStyle.copyWith(fontSize: 13).regular;

  /// Text use for item's title text like: bottom bar, header items, ...
  ///
  /// Default: size: 13, weight: regular
  static TextStyle headerItemText = _defaultStyle.copyWith(fontSize: 14).bold;

  /// Text use for small text like: note, guideline text, ...
  ///
  /// Default: size: 12, weight: regular
  static TextStyle smallText = _defaultStyle.copyWith(fontSize: 12).regular;

  /// Text use for caption of TextField
  ///
  /// Default: size: 10, weight: regular
  static TextStyle captionText = _defaultStyle.copyWith(fontSize: 10).regular;
}
// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);
