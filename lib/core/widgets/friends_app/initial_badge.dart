import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitialBadge extends StatelessWidget {
  InitialBadge({
    super.key,
    required this.name,
    required this.palette,
    double? size,
    this.radius,
  }) : size = size ?? 28.r;

  final String name;
  final PlayerPalette palette;
  final double size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: palette.fill,
        borderRadius: BorderRadius.circular(radius ?? size / 2),
      ),
      child: Text(
        name.isEmpty ? '؟' : name.characters.first,
        style: AppText.bigInitial(size * .43, palette.on),
      ),
    );
  }
}
