import 'package:flutter/material.dart';
import 'package:recipe_app_ui/core/app_colors.dart';
import '../constants/string_const.dart';

class AppTextStyles {
  static const greetingLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 14,
    height: 21 / 14,
    letterSpacing: -0.1504,
    color: AppColors.textSecondaryColor,
  );

  static const userName = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 20,
    height: 30 / 20,
    letterSpacing: -0.4492,
    color: AppColors.textPrimaryColor,
  );

  static const heroTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 26,
    height: 37.96 / 26,
    letterSpacing: -0.7842,
    color: AppColors.textPrimaryColor,
  );

  static const searchPlaceholder = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    letterSpacing: -0.0762,
    color: AppColors.placeholderColor,
  );

  static const categoryChip = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: -0.0762,
    color: AppColors.textPrimaryColor,
  );

  static const categoryChipSelected = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: -0.0762,
    color: AppColors.whiteColor,
  );

  static const sectionTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w600,
    fontSize: 18,
    height: 27 / 18,
    letterSpacing: -0.4395,
    color: AppColors.textPrimaryColor,
  );

  static const seeAll = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: -0.0762,
    color: AppColors.textMutedColor,
  );

  static const recipeCardTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 15,
    height: 20 / 15,
    letterSpacing: -0.2344,
    color: AppColors.textPrimaryColor,
  );

  static const recipeCardTitleSmall = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: -0.1504,
    color: AppColors.textPrimaryColor,
  );

  static const recipeCardDescription = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 12,
    height: 20 / 12,
    color: AppColors.textTertiaryColor,
  );

  static const timeBadge = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 12,
    height: 18 / 12,
    color: AppColors.whiteColor,
  );

  static const bottomNavLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 12,
    height: 18 / 12,
    color: AppColors.textTertiaryColor,
  );

  static const bottomNavLabelActive = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 12,
    height: 18 / 12,
    color: AppColors.primaryGreenColor,
  );

  static const topNavTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 20,
    height: 30 / 20,
    letterSpacing: -0.4492,
    color: AppColors.textPrimaryColor,
  );

  static const detailTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 25,
    height: 34 / 25,
    letterSpacing: -0.6596,
    color: AppColors.textPrimaryColor,
  );

  static const rating = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 12,
    height: 18 / 12,
    color: AppColors.textPrimaryColor,
  );

  static const metaLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: -0.0762,
    color: AppColors.textPrimaryColor,
  );

  static const descriptionHeading = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 18,
    height: 27 / 18,
    letterSpacing: -0.4395,
    color: AppColors.textPrimaryColor,
  );

  static const descriptionBody = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 20 / 13,
    letterSpacing: -0.0762,
    color: AppColors.textSecondaryColor,
  );

  static const showMore = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w700,
    fontSize: 13,
    height: 20 / 13,
    letterSpacing: -0.0762,
    color: AppColors.showMoreColor,
  );

  static const accordionTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w500,
    fontSize: 18,
    height: 27 / 18,
    letterSpacing: -0.4395,
    color: AppColors.textPrimaryColor,
  );

  static const accordionBody = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 21 / 13,
    letterSpacing: -0.0762,
    color: AppColors.textTertiaryColor,
  );

  static const accordionCount = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: -0.0762,
    color: AppColors.textCountColor,
  );

  static const primaryButton = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: -0.3125,
    color: AppColors.whiteColor,
  );

  static const imageBadge = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontWeight: .w400,
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: -0.0762,
    color: AppColors.whiteColor,
  );
}
