import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/answer_input.dart';
import 'package:fii90/core/widgets/match_app/countdown_ring.dart';
import 'package:fii90/core/widgets/match_app/spin_ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuzzerAnswerZone extends StatelessWidget {
  const BuzzerAnswerZone({
    super.key,
    required this.controller,
    required this.seconds,
    required this.onSend,
    required this.verifying,
    this.reboundFrom,
  });

  final TextEditingController controller;
  final int seconds;
  final VoidCallback onSend;
  final bool verifying;
  final String? reboundFrom;

  @override
  Widget build(BuildContext context) {
    final rebound = reboundFrom;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (rebound != null) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.tint(AppColors.me, .14),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              context.tr(AppStrings.reboundChance, args: [rebound]),
              style: AppText.modeTag(AppColors.meInk),
            ),
          ),
          SizedBox(height: 16.h),
        ],
        CountdownRing(
          size: 112.r,
          width: 9.5.r,
          progress: seconds / 7,
          color: seconds <= 2 ? AppColors.bad : AppColors.me,
          child: Text('$seconds', style: AppText.countdown(44)),
        ),
        SizedBox(height: 16.h),
        Text(
          context.tr(AppStrings.answerNow),
          style: AppText.feedbackTitle(AppColors.meInk, 21),
        ),
        SizedBox(height: 16.h),
        AnswerInput(
          controller: controller,
          hint: context.tr(AppStrings.playerNameHint),
          sendLabel: context.tr(AppStrings.send),
          onSend: onSend,
          height: 58.r,
        ),
        if (verifying) ...[
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinRing(size: 16.r, color: AppColors.pri, width: 2.r),
              SizedBox(width: 8.w),
              Text(context.tr(AppStrings.verifying), style: AppText.statusLine),
            ],
          ),
        ],
      ],
    );
  }
}
