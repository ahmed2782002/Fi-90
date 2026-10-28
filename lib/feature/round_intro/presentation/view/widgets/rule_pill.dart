import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class RulePill extends StatelessWidget {
  const RulePill({
    super.key,
    required this.number,
    required this.text,
    required this.accent,
    required this.ink,
  });

  final int number;
  final String text;
  final Color accent;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Enter(
      fx: Fx.fadeUp,
      duration: const Duration(milliseconds: 450),
      delay: Duration(milliseconds: 200 + (number - 1) * 120),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.line),
          boxShadow: AppShadows.sh1,
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.tint(accent, .16),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text('$number', style: AppText.ruleNumber(ink)),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: AppText.ruleText)),
          ],
        ),
      ),
    );
  }
}
