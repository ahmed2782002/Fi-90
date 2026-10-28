import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class AuctionSetup extends StatelessWidget {
  const AuctionSetup({super.key, required this.onPick});

  final ValueChanged<int> onPick;

  @override
  Widget build(BuildContext context) {
    final options = [
      (
        5,
        '100M',
        AppStrings.fivePlayers,
        AppStrings.fivePlayersHint,
        '1-2-1',
        false,
      ),
      (
        11,
        '250M',
        AppStrings.elevenPlayers,
        AppStrings.elevenPlayersHint,
        '4-3-3',
        true,
      ),
    ];
    return Enter(
      fx: Fx.fadeUp,
      duration: const Duration(milliseconds: 350),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.line),
          boxShadow: AppShadows.sh1,
        ),
        child: Column(
          children: [
            Text(
              context.tr(AppStrings.pickAuctionType),
              style: AppText.sheetTitle,
            ),
            const SizedBox(height: 4),
            Text(
              context.tr(AppStrings.budgetDecides),
              textAlign: TextAlign.center,
              style: AppText.screenSubtitle,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                for (final (i, (size, budget, title, hint, shape, featured))
                    in options.indexed) ...[
                  if (i > 0) const SizedBox(width: 10),
                  Expanded(
                    child: PressScale(
                      onTap: () => onPick(size),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 18, 10, 16),
                        decoration: BoxDecoration(
                          color: featured
                              ? AppColors.mix(AppColors.gold, .1, AppColors.s2)
                              : AppColors.s2,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: featured ? AppColors.gold : AppColors.line2,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              budget,
                              textDirection: TextDirection.ltr,
                              style: AppText.budgetBig,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              context.tr(title),
                              textAlign: TextAlign.center,
                              style: AppText.optionTitle,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              context.tr(hint),
                              textAlign: TextAlign.center,
                              style: AppText.meta,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.s3,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                shape,
                                textDirection: TextDirection.ltr,
                                style: AppText.formation,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
