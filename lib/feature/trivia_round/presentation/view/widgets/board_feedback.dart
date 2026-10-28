import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/feedback_panel.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_state.dart';
import 'package:flutter/material.dart';

class BoardFeedback extends StatelessWidget {
  const BoardFeedback({
    super.key,
    required this.kind,
    required this.who,
    required this.whoColor,
    required this.to,
    required this.strikes,
    required this.unlock,
    required this.text,
    this.answer,
    this.fromOpponent = false,
  });

  final FeedbackKind kind;
  final String who;
  final Color whoColor;
  final String to;
  final int strikes;
  final bool unlock;
  final String text;
  final String? answer;
  final bool fromOpponent;

  @override
  Widget build(BuildContext context) {
    final timeout =
        kind == FeedbackKind.timeout ||
        (kind == FeedbackKind.out && text.isEmpty);
    final turnLine = (
      text: context.tr(AppStrings.turnWentTo, args: [to]),
      style: AppText.meta,
    );
    final unlockLine = (
      text: context.tr(AppStrings.passUnlockedFor, args: [who]),
      style: AppText.feedbackNote(AppColors.goldInk),
    );
    return switch (kind) {
      FeedbackKind.verify => FeedbackPanel(
        background: AppColors.glass,
        spinner: true,
        lines: [
          (
            text: context.tr(AppStrings.verifying),
            style: AppText.feedbackTitle(AppColors.tx, 17),
          ),
          if (fromOpponent)
            (
              text: context.tr(AppStrings.oppWrote, args: [who, text]),
              style: AppText.feedbackSub(AppColors.opInk),
            ),
        ],
      ),
      FeedbackKind.ok || FeedbackKind.exhausted => FeedbackPanel(
        background: AppColors.mix(AppColors.ok, .14, AppColors.bg2),
        badge: '✓',
        badgeColor: AppColors.ok,
        badgeInk: AppColors.checkInk,
        lines: [
          (
            text: context.tr(AppStrings.correctAnswer),
            style: AppText.feedbackTitle(AppColors.okInk, 21),
          ),
          (text: answer ?? '', style: AppText.rowTitle),
          (
            text: context.tr(AppStrings.whoTurnWent, args: [who, to]),
            style: AppText.feedbackSub(whoColor),
          ),
        ],
      ),
      FeedbackKind.pass => FeedbackPanel(
        background: AppColors.mix(AppColors.gold, .14, AppColors.bg2),
        badge: 'PASS',
        badgeColor: AppColors.gold,
        badgeInk: AppColors.leaderGoldInk,
        lines: [
          (
            text: context.tr(AppStrings.usedPass, args: [who]),
            style: AppText.feedbackTitle(AppColors.tx, 17),
          ),
          (
            text: context.tr(AppStrings.passMustAnswer, args: [to]),
            style: AppText.meta,
          ),
        ],
      ),
      FeedbackKind.dup => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            context.tr(AppStrings.alreadyOnBoard),
            textAlign: TextAlign.center,
            style: AppText.dupBanner,
          ),
        ),
      ),
      _ => FeedbackPanel(
        background: AppColors.mix(AppColors.bad, .12, AppColors.bg2),
        shake: !timeout,
        badge: timeout ? null : '✕',
        badgeColor: AppColors.bad,
        lines: [
          if (timeout) (text: '0', style: AppText.timeoutZero),
          (
            text: context.tr(
              timeout ? AppStrings.timeUp : AppStrings.wrongAnswer,
            ),
            style: AppText.feedbackTitle(AppColors.badInk, 21),
          ),
          if (!timeout) (text: text, style: AppText.struckAnswer),
          (
            text: context.tr(
              timeout ? AppStrings.timeoutStrike : AppStrings.whoStrikes,
              args: [who, '$strikes'],
            ),
            style: AppText.feedbackNote(AppColors.badInk),
          ),
          if (unlock) unlockLine,
          if (kind != FeedbackKind.out) turnLine,
        ],
      ),
    };
  }
}
