import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/judge_buttons.dart';
import 'package:fii90/core/widgets/match_app/countdown_ring.dart';
import 'package:flutter/material.dart';

class ActActingView extends StatelessWidget {
  const ActActingView({
    super.key,
    required this.seconds,
    required this.total,
    required this.actor,
    required this.team,
    required this.levelLabel,
    required this.points,
    required this.onJudge,
  });

  final int seconds;
  final int total;
  final String actor;
  final String team;
  final String levelLabel;
  final int points;
  final ValueChanged<bool> onJudge;

  @override
  Widget build(BuildContext context) {
    final urgent = seconds <= 10;
    return Column(
      spacing: 12,
      children: [
        CountdownRing(
          size: 180,
          width: 15,
          progress: seconds / total,
          color: urgent ? AppColors.bad : AppColors.op,
          rest: AppColors.s3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$seconds',
                style: AppText.actTimer(
                  urgent ? AppColors.badInk : AppColors.tx,
                ),
              ),
              Text(context.tr(AppStrings.second), style: AppText.cardCaption),
            ],
          ),
        ),
        Text(
          context.tr(AppStrings.actingNow, args: [actor, team]),
          textAlign: TextAlign.center,
          style: AppText.cardHeading,
        ),
        Text(
          context.tr(AppStrings.pointsIfGuessed, args: [levelLabel, '$points']),
          style: AppText.pageIntro,
        ),
        const SizedBox(height: 4),
        JudgeButtons(
          okLabel: context.tr(AppStrings.theyGotIt),
          badLabel: context.tr(AppStrings.theyMissed),
          onOk: () => onJudge(true),
          onBad: () => onJudge(false),
          height: 60,
        ),
      ],
    );
  }
}
