import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/feature/home/mock_model/home_summary.dart';
import 'package:fii90/feature/home/mock_model/quick_mode.dart';
import 'package:fii90/feature/home/presentation/view/widgets/coins_button.dart';
import 'package:fii90/feature/home/presentation/view/widgets/daily_challenge_card.dart';
import 'package:fii90/feature/home/presentation/view/widgets/last_match_tile.dart';
import 'package:fii90/feature/home/presentation/view/widgets/match_hero_card.dart';
import 'package:fii90/feature/home/presentation/view/widgets/notification_button.dart';
import 'package:fii90/feature/home/presentation/view/widgets/quick_mode_grid.dart';
import 'package:fii90/feature/home/presentation/view/widgets/section_header.dart';
import 'package:fii90/feature/journey/mock_model/match_record.dart';
import 'package:fii90/feature/journey/presentation/view_model/journey_cubit.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/play_sheet.dart';
import 'package:fii90/feature/layout/presentation/view_model/layout_cubit.dart';
import 'package:fii90/feature/layout/presentation/view_model/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _summary = HomeSummary.mock;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppGradients.fade(
          AppColors.pri,
          x: .5,
          y: 0,
          rx: .9,
          ry: .3,
          alpha: .14,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 9, 18, 110),
          children: [
            Row(
              children: [
                CoinsButton(coins: _summary.coins, onTap: () {}),
                const Spacer(),
                NotificationButton(count: _summary.notifications, onTap: () {}),
              ],
            ),
            const SizedBox(height: 18),
            MatchHeroCard(
              onlinePlayers: _summary.onlinePlayers,
              onStart: () => PlaySheet.show(context),
            ),
            const SizedBox(height: 18),
            SectionHeader(
              title: context.tr(AppStrings.playOneChallenge),
              action: context.tr(AppStrings.quickRound),
              actionStyle: AppText.sectionHint,
            ),
            const SizedBox(height: 18),
            QuickModeGrid(
              modes: QuickMode.mock,
              onSelect: (mode) =>
                  PlaySheet.show(context, modeKey: mode.titleKey),
            ),
            const SizedBox(height: 18),
            DailyChallengeCard(
              done: _summary.dailyDone,
              total: _summary.dailyTotal,
              progress: _summary.dailyProgress,
              hoursLeft: _summary.dailyHoursLeft,
              xp: _summary.dailyXp,
            ),
            const SizedBox(height: 18),
            SectionHeader(
              title: context.tr(AppStrings.lastMatch),
              action: context.tr(AppStrings.matchHistory),
              actionStyle: AppText.sectionLink,
              onAction: () {
                context.read<JourneyCubit>().showHistory();
                context.read<LayoutCubit>().select(LayoutTab.journey);
              },
            ),
            const SizedBox(height: 18),
            LastMatchTile(record: MatchRecord.mock.first),
          ],
        ),
      ),
    );
  }
}
