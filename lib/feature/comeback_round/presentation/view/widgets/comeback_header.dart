import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComebackHeader extends StatelessWidget {
  const ComebackHeader({
    super.key,
    required this.progress,
    required this.points,
    required this.nextClub,
    required this.secondsLeft,
    required this.playing,
  });

  final String progress;
  final int points;
  final double nextClub;
  final int secondsLeft;
  final bool playing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: AppColors.tint(AppColors.m4, .16),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                context.tr(AppStrings.comebackTag, args: [progress]),
                style: AppText.modeTag(AppColors.m4Ink),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                context.tr(AppStrings.bothCanAnswer),
                style: AppText.bothHint,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.line),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    context.tr(AppStrings.pointsLabel),
                    style: AppText.pointsCaption,
                  ),
                  SizedBox(width: 5.w),
                  Text('$points', style: AppText.pointsValue),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
          decoration: BoxDecoration(
            color: AppColors.s1,
            borderRadius: BorderRadius.circular(28.r),
            border: Border.all(color: AppColors.line),
            boxShadow: AppShadows.sh1,
          ),
          child: Row(
            children: [
              TintedIconBox(
                icon: AppIcons.person,
                tint: AppColors.m4,
                ink: AppColors.m4Ink,
                size: 58.r,
                radius: 20.r,
                iconSize: 30.r,
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(AppStrings.whoIsThisPlayer),
                      style: AppText.comebackTitle,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      context.tr(AppStrings.careerHint),
                      style: AppText.meta,
                    ),
                    if (playing) ...[
                      SizedBox(height: 8.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9.r),
                        child: LinearProgressIndicator(
                          value: nextClub,
                          minHeight: 5.r,
                          color: AppColors.m4,
                          backgroundColor: AppColors.s3,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Loop(
                        period: const Duration(seconds: 1),
                        builder: (context, t, child) => Opacity(
                          opacity: 1 - .7 * (1 - (2 * t - 1).abs()),
                          child: child,
                        ),
                        child: Text(
                          context.tr(
                            AppStrings.secondsLeft,
                            args: ['$secondsLeft'],
                          ),
                          style: AppText.lastCall,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
