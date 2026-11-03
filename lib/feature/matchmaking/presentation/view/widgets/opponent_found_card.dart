import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpponentFoundCard extends StatelessWidget {
  const OpponentFoundCard({
    super.key,
    required this.title,
    required this.name,
    required this.initial,
    required this.details,
  });

  final String title;
  final String name;
  final String initial;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Enter(
          fx: Fx.pop,
          child: Text(title, style: AppText.display(24)),
        ),
        SizedBox(height: 14.h),
        Enter(
          fx: Fx.slideE,
          delay: const Duration(milliseconds: 150),
          child: Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(color: AppColors.op, width: 1.5),
              boxShadow: AppShadows.sh2,
            ),
            child: Row(
              children: [
                Container(
                  width: 54.r,
                  height: 54.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.op,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    initial,
                    style: AppText.bigInitial(24, AppColors.opOn),
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: AppText.cardHeading),
                      Text(details, style: AppText.cardCaption),
                    ],
                  ),
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      width: 7.r,
                      height: 7.r,
                      decoration: BoxDecoration(
                        color: AppColors.ok,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text('48ms', style: AppText.latency),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
