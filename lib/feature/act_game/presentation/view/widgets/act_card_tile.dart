import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class ActCardTile extends StatelessWidget {
  const ActCardTile({
    super.key,
    required this.number,
    required this.name,
    required this.resultColor,
    required this.ok,
    required this.onTap,
  });

  final int number;
  final String? name;
  final Color? resultColor;
  final bool ok;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = name;
    final result = resultColor;
    return PressScale(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 5 / 7,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: label == null ? AppColors.cardDeep : AppColors.s1,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: result ?? AppColors.tint(AppColors.neon, .55),
              width: 1.5,
            ),
            boxShadow: label == null
                ? [
                    BoxShadow(
                      color: AppColors.tint(AppColors.neon, .35),
                      blurRadius: 14,
                    ),
                  ]
                : null,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (label == null) ...[
                Transform.scale(
                  scale: 1.14,
                  child: Image.asset(AppImages.cardBackAlt, fit: BoxFit.cover),
                ),
                Align(
                  alignment: const Alignment(0, .86),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tint(AppColors.cardDeep, .75),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: AppColors.tint(AppColors.neon, .6),
                      ),
                    ),
                    child: Text(
                      number.toString().padLeft(2, '0'),
                      style: AppText.cardNumber,
                    ),
                  ),
                ),
              ] else ...[
                Center(
                  child: Text(
                    label.characters.first,
                    style: AppText.display(
                      26,
                      color: AppColors.tint(AppColors.tx, ok ? .9 : .35),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                    child: Text(
                      label,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: AppText.actCardName,
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 3,
                  end: 3,
                  child: Container(
                    width: 17,
                    height: 17,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: result,
                      shape: BoxShape.circle,
                    ),
                    child: Text(ok ? '✓' : '✕', style: AppText.cardResult),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
