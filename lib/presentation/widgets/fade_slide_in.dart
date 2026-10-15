import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/number_constant.dart';

class FadeSlideIn extends StatelessWidget {
  final Widget child;
  final int delay;
  final int duration;
  final double offsetY;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = 0,
    this.duration = NumberConstant.animMedium,
    this.offsetY = NumberConstant.animSlideOffset,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: duration + delay),
      curve: Interval(delay / (duration + delay), 1, curve: Curves.easeOutCubic),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(offset: Offset(0, offsetY * (1 - value)), child: child,),
      ),
      child: child,
    );
  }
}
