import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/buzzer_round/presentation/view/widgets/bell_stage.dart';
import 'package:fii90/feature/buzzer_round/presentation/view_model/buzzer_state.dart';
import 'package:flutter/material.dart';

class BuzzerBellZone extends StatelessWidget {
  const BuzzerBellZone({
    super.key,
    required this.phase,
    required this.opponent,
    required this.seconds,
    required this.gap,
    required this.onPress,
  });

  final BuzzerPhase phase;
  final String opponent;
  final int seconds;
  final double gap;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final (labelKey, chip, ink, glow) = switch (phase) {
      BuzzerPhase.ready => (
        AppStrings.waitQuestion,
        AppColors.s2,
        AppColors.mu,
        AppColors.tint(AppColors.priInk, .25),
      ),
      BuzzerPhase.active => (
        AppStrings.pressBell,
        AppColors.bad,
        AppColors.white,
        AppColors.tint(AppColors.redGlow, .55),
      ),
      BuzzerPhase.sending => (
        AppStrings.ding,
        AppColors.bad,
        AppColors.white,
        AppColors.tint(AppColors.redGlow, .6),
      ),
      BuzzerPhase.meFirst => (
        AppStrings.youFastest,
        AppColors.me,
        AppColors.meOn,
        AppColors.tint(AppColors.neon, .6),
      ),
      BuzzerPhase.oppFirst => (
        AppStrings.oppPressedFirst,
        AppColors.op,
        AppColors.opOn,
        AppColors.tint(AppColors.op, .5),
      ),
      _ => (
        AppStrings.oppAnswering,
        AppColors.op,
        AppColors.opOn,
        AppColors.tint(AppColors.op, .5),
      ),
    };
    final gapText = gap.toStringAsFixed(2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            child: BellStage(
              label: context.tr(labelKey, args: [opponent]),
              labelColor: chip,
              labelInk: ink,
              glow: glow,
              live: phase == BuzzerPhase.active,
              pressed:
                  phase == BuzzerPhase.sending || phase == BuzzerPhase.oppFirst,
              dimmed: phase == BuzzerPhase.ready || phase.oppSide,
              onPress: onPress,
              semanticLabel: context.tr(AppStrings.pressBell),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (phase == BuzzerPhase.active)
          Text(
            context.tr(AppStrings.nobodyPressed, args: ['$seconds']),
            style: AppText.meta,
          ),
        if (phase == BuzzerPhase.meFirst)
          Text(
            context.tr(
              gap < .25 ? AppStrings.almostTie : AppStrings.beatOpponent,
              args: [opponent, '${gapText}s'],
            ),
            textAlign: TextAlign.center,
            style: AppText.feedbackSub(AppColors.meInk),
          ),
        if (phase.oppSide)
          Text(
            context.tr(AppStrings.waitYourChance),
            style: AppText.statusLine,
          ),
      ],
    );
  }
}
