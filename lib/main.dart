import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
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
        brightness: .light
      ),
      routerConfig: router,
      builder: (ctx, child)=> child!,
    );
  }
}
