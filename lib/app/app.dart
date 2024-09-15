import 'package:crafty_bay/app/app_themes.dart';
import 'package:crafty_bay/app/routes/app_routes.dart';
import 'package:crafty_bay/bindings/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.appRoutes(),
      initialBinding: AppBindings(),
      theme: AppThemes.lightThemeData(),
      darkTheme: AppThemes.darkThemeData(),
      themeMode: ThemeMode.system,
    );
  }
}
