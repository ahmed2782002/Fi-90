import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class InitialBadge extends StatelessWidget {
  const InitialBadge({
    super.key,
    required this.name,
    required this.palette,
    this.size = 28,
    this.radius,
  });

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
