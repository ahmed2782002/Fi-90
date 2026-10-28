import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/match_app/countdown_ring.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/match/presentation/view_model/match_state.dart';
import 'package:fii90/feature/round_intro/presentation/view/widgets/mode_headline.dart';
import 'package:fii90/feature/round_intro/presentation/view/widgets/rule_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundIntroScreen extends StatelessWidget {
  const RoundIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        final mode = state.mode;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: context.read<MatchCubit>().startRound,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppGradients.fade(
                mode.accent,
                x: .5,
                y: .26,
                rx: .9,
                ry: .5,
                alpha: .3,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 23, 24, 46),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.tr(
                        AppStrings.roundOf,
                        args: [
                          '${state.roundIndex + 1}',
                          '${state.modes.length}',
                        ],
                      ),
                      style: AppText.introRound,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ModeHeadline(
                            icon: mode.icon,
                            name: context.tr(mode.nameKey),
                            hook: context.tr(mode.hookKey),
                            accent: mode.accent,
                            ink: mode.ink,
                          ),
                          const SizedBox(height: 24),
                          for (var i = 0; i < mode.ruleKeys.length; i++) ...[
                            if (i > 0) const SizedBox(height: 8),
                            RulePill(
                              number: i + 1,
                              text: context.tr(mode.ruleKeys[i]),
                              accent: mode.accent,
                              ink: mode.ink,
                            ),
                          ],
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CountdownRing(
                          size: 48,
                          width: 5.5,
                          progress: state.introCount / 4,
                          color: mode.accent,
                          child: Text(
                            '${state.introCount}',
                            style: AppText.ringCount,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            context.tr(AppStrings.startsAutomatically),
                            style: AppText.introRound,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.s1,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppColors.line2),
                          ),
                          child: Text(
                            context.tr(AppStrings.ready),
                            style: AppText.readyChip,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
