import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalScoreCard extends StatelessWidget {
  const FinalScoreCard({
    super.key,
    required this.meName,
    required this.meScore,
    required this.oppName,
    required this.oppInitial,
    required this.oppScore,
  });

  final String meName;
  final int meScore;
  final String oppName;
  final String oppInitial;
  final int oppScore;

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final left = rtl ? oppScore : meScore;
    final right = rtl ? meScore : oppScore;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        children: [
          // Players sit on a small row above the score so long names never
          // get squeezed by the big digits.
          Row(
            children: [
              Expanded(
                child: _PlayerTag(
                  name: meName,
                  initial: meName.characters.first,
                  fill: AppColors.me,
                  onFill: AppColors.meOn,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _PlayerTag(
                  name: oppName,
                  initial: oppInitial,
                  fill: AppColors.op,
                  onFill: AppColors.opOn,
                  end: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '$left'),
                  TextSpan(text: '  –  ', style: AppText.finalDash),
                  TextSpan(text: '$right'),
                ],
              ),
              textDirection: TextDirection.ltr,
              style: AppText.finalScore,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerTag extends StatelessWidget {
  const _PlayerTag({
    required this.name,
    required this.initial,
    required this.fill,
    required this.onFill,
    this.end = false,
  });

  final String name;
  final String initial;
  final Color fill;
  final Color onFill;
  final bool end;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: end ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 30.r,
          height: 30.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(initial, style: AppText.bigInitial(13, onFill)),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.hudName,
          ),
        ),
      ],
    );
  }
}
