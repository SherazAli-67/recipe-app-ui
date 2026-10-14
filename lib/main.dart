import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_colors.dart';
import 'package:recipe_app_ui/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.whiteColor,
        colorScheme: .light(
          primary: AppColors.primaryGreenColor,
          onPrimary: AppColors.whiteColor,
          surface: AppColors.whiteColor,
          onSurface: AppColors.textPrimaryColor,
        ),
      ),
      routerConfig: router,
      builder: (ctx, child) => child!,
    );
  }
}
