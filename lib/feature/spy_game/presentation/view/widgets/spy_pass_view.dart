import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SpyPassView extends StatelessWidget {
  const SpyPassView({
    super.key,
    required this.name,
    required this.palette,
    required this.number,
    required this.total,
    required this.onReady,
  });

  final String name;
  final PlayerPalette palette;
  final int number;
  final int total;
  final VoidCallback onReady;

  @override
  Widget build(BuildContext context) {
    return Enter(
      key: ValueKey(number),
      fx: Fx.fadeUp,
      child: Column(
        spacing: 14,
        children: [
          const SizedBox(height: 14),
          InitialBadge(name: name, palette: palette, size: 84, radius: 28),
          Text(
            context.tr(AppStrings.handPhoneTo, args: [name]),
            textAlign: TextAlign.center,
            style: AppText.cardTitleBig,
          ),
          Text(
            context.tr(AppStrings.flipAlone),
            textAlign: TextAlign.center,
            style: AppText.pageIntro,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.s2,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              context.tr(AppStrings.playerOf, args: ['$number', '$total']),
              style: AppText.cardCaption,
            ),
          ),
          const SizedBox(height: 14),
          PrimaryButton(
            label: context.tr(AppStrings.imReadyName, args: [name]),
            onTap: onReady,
            height: 56,
          ),
        ],
      ),
    );
  }
}
