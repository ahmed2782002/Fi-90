import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankQuestionCard extends StatelessWidget {
  const BankQuestionCard({
    super.key,
    required this.player,
    required this.palette,
    required this.levelLabel,
    required this.levelColor,
    required this.question,
    this.answer,
  });

  final String player;
  final PlayerPalette palette;
  final String levelLabel;
  final Color levelColor;
  final String question;
  final String? answer;

  @override
  Widget build(BuildContext context) {
    final reveal = answer;
    return Container(
      constraints: BoxConstraints(minHeight: 170.r),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        gradient: AppColors.grad,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.neon, width: 1.5),
        boxShadow: AppShadows.glow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12.r,
        children: [
          Row(
            children: [
              InitialBadge(name: player, palette: palette),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  context.tr(AppStrings.questionFor, args: [player]),
                  style: AppText.questionFor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: levelColor,
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Text(levelLabel, style: AppText.levelTag),
              ),
            ],
          ),
          Text(question, style: AppText.bankQuestion),
          if (reveal != null)
            Enter(
              fx: Fx.fadeIn,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.black, .25),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Text(
                  context.tr(AppStrings.theAnswer, args: [reveal]),
                  style: AppText.bankAnswer,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
