import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class BidActions extends StatelessWidget {
  const BidActions({
    super.key,
    required this.canRaise,
    required this.hint,
    required this.onRaise,
    required this.onPass,
  });

  final bool canRaise;
  final String hint;
  final VoidCallback onRaise;
  final VoidCallback onPass;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: PressScale(
                onTap: canRaise ? onRaise : null,
                child: Opacity(
                  opacity: canRaise ? 1 : .45,
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.goldDeep,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      '+1M',
                      textDirection: TextDirection.ltr,
                      style: AppText.bidAction(AppColors.leaderGoldInk),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: PressScale(
                onTap: onPass,
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.tint(AppColors.bad, .1),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.bad, width: 1.5),
                  ),
                  child: Text(
                    context.tr(AppStrings.takeIt),
                    style: AppText.bidAction(AppColors.badInk),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(hint, textAlign: TextAlign.center, style: AppText.bidHint),
      ],
    );
  }
}
