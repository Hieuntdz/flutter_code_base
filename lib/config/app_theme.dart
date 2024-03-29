import '../constants/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.primaryColor,
      splashColor: AppColors.splashColor,
      brightness: Brightness.light,
      // Textfield
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
