import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/match/presentation/view_model/match_state.dart';
import 'package:fii90/feature/matchmaking/presentation/view/widgets/opponent_found_card.dart';
import 'package:fii90/feature/matchmaking/presentation/view/widgets/search_radar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchmakingScreen extends StatelessWidget {
  const MatchmakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        final cubit = context.read<MatchCubit>();
        final opp = context.tr(cubit.oppNameKey);
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppGradients.fade(
              AppColors.me,
              x: .5,
              y: .42,
              rx: .7,
              ry: .4,
              alpha: .16,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 9, 22, 44),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    context.tr(AppStrings.quickMatch),
                    style: AppText.screenSubtitle,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchRadar(
                          initial: context
                              .tr(AppStrings.mockPlayerAhmed)
                              .characters
                              .first,
                          found: state.found,
                        ),
                        const SizedBox(height: 34),
                        if (!state.found) ...[
                          Text(
                            context.tr(AppStrings.searchingOpponent),
                            style: AppText.screenTitle,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            context.tr(AppStrings.sameLevelPlayers),
                            style: AppText.pageIntro,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '00:0${state.searchSeconds.clamp(0, 9)}',
                            textDirection: TextDirection.ltr,
                            style: AppText.searchTimer,
                          ),
                        ] else
                          OpponentFoundCard(
                            title: context.tr(AppStrings.opponentFound),
                            name: opp,
                            initial: cubit.initialOf(opp),
                            details: context.tr(
                              AppStrings.opponentDetails,
                              args: [context.tr(cubit.oppLevelKey)],
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (!state.found)
                    PressScale(
                      onTap: cubit.cancel,
                      child: Container(
                        height: 54,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.s1,
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: AppColors.line2),
                        ),
                        child: Text(
                          context.tr(AppStrings.cancelSearch),
                          style: AppText.secondaryButton,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
