import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';

class TintedIconBox extends StatelessWidget {
  const TintedIconBox({
    super.key,
    required this.icon,
    required this.tint,
    required this.ink,
    this.size = 38,
    this.radius = 13,
    this.iconSize = 20,
    this.tintAlpha = .14,
    this.keepColors = false,
  });

  final String icon;
  final Color tint;
  final Color ink;
  final double size;
  final double radius;
  final double iconSize;
  final double tintAlpha;
  final bool keepColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.tint(tint, tintAlpha),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SvgPicture.asset(
        icon,
        width: iconSize,
        height: iconSize,
        colorFilter: keepColors ? null : ColorFilter.mode(ink, BlendMode.srcIn),
      ),
    );
  }
}
