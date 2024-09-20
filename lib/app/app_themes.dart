import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightThemeData() {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      progressIndicatorTheme: _progressIndicatorThemeData(),
      textTheme: TextTheme(
        headlineLarge: _headLineLargeTextStyle(),
      ),
      inputDecorationTheme: _inputDecorationTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
      appBarTheme: _appBarTheme(),
      floatingActionButtonTheme: _floatingActionButtonThemeData(),
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonThemeData() {
    return FloatingActionButtonThemeData(
      elevation: 3,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      progressIndicatorTheme: _progressIndicatorThemeData(),
      textTheme: TextTheme(
        headlineLarge: _headLineLargeTextStyle(),
      ),
      inputDecorationTheme: _inputDecorationTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
      appBarTheme: _appBarTheme(),
      floatingActionButtonTheme: _floatingActionButtonThemeData(),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }

  static TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.themeColor,
            textStyle: const TextStyle(fontSize: 16)));
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.themeColor,
        foregroundColor: AppColors.whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: const Size.fromWidth(double.maxFinite),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        errorBorder: _outlineInputBorder(Colors.red),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w400,
        ));
  }

  static OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor, width: 1),
      borderRadius: BorderRadius.circular(8),
    );
  }

  static TextStyle _headLineLargeTextStyle() {
    return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
  }

  static ProgressIndicatorThemeData _progressIndicatorThemeData() {
    return const ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    );
  }
}
