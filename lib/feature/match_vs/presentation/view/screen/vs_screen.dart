import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/match/presentation/view_model/match_state.dart';
import 'package:fii90/feature/match_vs/presentation/view/widgets/vs_countdown.dart';
import 'package:fii90/feature/match_vs/presentation/view/widgets/vs_player_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VsScreen extends StatelessWidget {
  const VsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        final cubit = context.read<MatchCubit>();
        final me = context.tr(AppStrings.mockPlayerAhmed);
        final opp = context.tr(cubit.oppNameKey);
        return Stack(
          children: [
            Column(
              children: [
                for (final (color, top) in [
                  (AppColors.me, true),
                  (AppColors.op, false),
                ])
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: top
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          end: top
                              ? Alignment.bottomCenter
                              : Alignment.topCenter,
                          colors: [
                            AppColors.mix(color, .3, AppColors.bg),
                            AppColors.mix(color, .08, AppColors.bg),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Positioned(
              top: 118,
              left: 26,
              right: 26,
              child: VsPlayerBanner(
                name: me,
                initial: me.characters.first,
                level: 'LV 24',
                tier: context.tr(AppStrings.profileTier),
                fill: AppColors.me,
                onFill: AppColors.meOn,
              ),
            ),
            Positioned(
              bottom: 118,
              left: 26,
              right: 26,
              child: VsPlayerBanner(
                name: opp,
                initial: cubit.initialOf(opp),
                level: context.tr(cubit.oppLevelKey),
                tier: context.tr(AppStrings.tierGold1),
                fill: AppColors.op,
                onFill: AppColors.opOn,
                mirrored: true,
              ),
            ),
            Center(
              child: VsCountdown(
                count: state.vsCount,
                goLabel: context.tr(AppStrings.letsGo),
              ),
            ),
          ],
        );
      },
    );
  }
}
