import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui/constants/number_constant.dart';
import 'package:recipe_app_ui/core/app_colors.dart';

class CircularIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double padding;

  const CircularIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.padding = NumberConstant.circularButtonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.chipBgColor,
          shape: .circle,
        ),
        child: Padding(
          padding: .all(padding),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: iconColor == null ? null : .mode(iconColor!, .srcIn),
          ),
        ),
      ),
    );
  }
}
