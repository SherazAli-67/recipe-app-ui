import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui/constants/number_constant.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_colors.dart';
import 'package:recipe_app_ui/core/app_textstyles.dart';
import 'package:recipe_app_ui/core/asset_res.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    (icon: AssetRes.icHome, label: StringConst.home),
    (icon: AssetRes.icNavSearch, label: StringConst.search),
    (icon: AssetRes.icSaved, label: StringConst.saved),
    (icon: AssetRes.icProfile, label: StringConst.profile),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(top: BorderSide(color: AppColors.navBorderColor)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: .fromLTRB(
            22,
            NumberConstant.bottomNavTopPadding,
            22,
            NumberConstant.bottomNavBottomPadding,
          ),
          child: Row(
            children: List.generate(
              _items.length,
              (index) => Expanded(child: _buildNavItem(index)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = _items[index];
    final isActive = currentIndex == index;
    final color = isActive ? AppColors.primaryGreenColor : AppColors.textTertiaryColor;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: .opaque,
      child: Column(
        mainAxisSize: .min,
        spacing: NumberConstant.bottomNavItemGap,
        children: [
          SvgPicture.asset(item.icon, colorFilter: .mode(color, .srcIn),),
          Text(item.label, style: isActive ? AppTextStyles.bottomNavLabelActive : AppTextStyles.bottomNavLabel,),
        ],
      ),
    );
  }
}
