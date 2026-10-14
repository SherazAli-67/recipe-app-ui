import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_textstyles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text(StringConst.search, style: AppTextStyles.topNavTitle,),),
      ),
    );
  }
}
