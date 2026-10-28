import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/strike_column.dart';
import 'package:flutter/material.dart';

class StrikesHeader extends StatelessWidget {
  const StrikesHeader({
    super.key,
    required this.meStrikes,
    required this.oppStrikes,
    required this.mePass,
    required this.oppPass,
  });

  final int meStrikes;
  final int oppStrikes;
  final ({bool used, bool ready}) mePass;
  final ({bool used, bool ready}) oppPass;

  @override
  Widget build(BuildContext context) {
    final sides = [(meStrikes, mePass, false), (oppStrikes, oppPass, true)];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          for (final (i, (strikes, pass, end)) in sides.indexed) ...[
            if (i == 1)
              Text(
                context.tr(AppStrings.threeStrikesOut),
                textAlign: TextAlign.center,
                style: AppText.strikesNote,
              ),
            Expanded(
              child: Align(
                alignment: end
                    ? AlignmentDirectional.centerEnd
                    : AlignmentDirectional.centerStart,
                child: StrikeColumn(
                  strikes: strikes,
                  end: end,
                  struck: pass.used,
                  chipLabel: context.tr(
                    pass.used
                        ? AppStrings.passChipUsed
                        : pass.ready
                        ? AppStrings.passChipReady
                        : AppStrings.passChipLater,
                  ),
                  chipColor: pass.ready && !pass.used
                      ? AppColors.tint(AppColors.gold, .18)
                      : AppColors.s2,
                  chipInk: pass.ready && !pass.used
                      ? AppColors.goldInk
                      : AppColors.dim,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
