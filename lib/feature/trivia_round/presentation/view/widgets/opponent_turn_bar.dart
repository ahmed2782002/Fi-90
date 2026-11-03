import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpponentTurnBar extends StatelessWidget {
  const OpponentTurnBar({
    super.key,
    required this.title,
    required this.initial,
    required this.status,
    required this.typing,
    required this.waitLabel,
    this.note,
  });

  final String title;
  final String initial;
  final String status;
  final bool typing;
  final String waitLabel;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final lock = note;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.mix(AppColors.op, .1, AppColors.s1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.op, width: 1.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppText.turnHeading(AppColors.opInk)),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Text(status, style: AppText.statusLine),
                        if (typing)
                          for (var i = 0; i < 3; i++)
                            Loop(
                              period: const Duration(milliseconds: 1200),
                              delay: Duration(milliseconds: i * 200),
                              builder: (context, t, child) => Opacity(
                                opacity: t < .4
                                    ? .25 + t / .4 * .75
                                    : t < .8
                                    ? 1 - (t - .4) / .4 * .75
                                    : .25,
                                child: child,
                              ),
                              child: Container(
                                width: 5.r,
                                height: 5.r,
                                margin: EdgeInsetsDirectional.only(start: 3.w),
                                decoration: BoxDecoration(
                                  color: AppColors.op,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                      ],
                    ),
                    if (lock != null) ...[
                      SizedBox(height: 4.h),
                      Text(lock, style: AppText.lockNote),
                    ],
                  ],
                ),
              ),
              Container(
                width: 44.r,
                height: 44.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.op,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  initial,
                  style: AppText.bigInitial(18, AppColors.opOn),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 56.r,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            color: AppColors.s2,
            borderRadius: BorderRadius.circular(999.r),
            border: Border.all(color: AppColors.line, width: 1.5),
          ),
          child: Text(waitLabel, style: AppText.waitLabel),
        ),
      ],
    );
  }
}
