import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnlinePlayersPill extends StatelessWidget {
  const OnlinePlayersPill({super.key, required this.count});

  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.tint(AppColors.black, .2),
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Loop(
            period: const Duration(milliseconds: 1600),
            builder: (context, t, child) => Opacity(
              opacity: 1 - .7 * (1 - (2 * t - 1).abs()),
              child: child,
            ),
            child: const SizedBox.square(
              dimension: 7,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.online,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            context.tr(AppStrings.playersOnline, args: [count]),
            style: AppText.onlineCount,
          ),
        ],
      ),
    );
  }
}
