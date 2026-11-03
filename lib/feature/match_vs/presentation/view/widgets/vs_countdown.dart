import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/countdown_ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VsCountdown extends StatelessWidget {
  const VsCountdown({super.key, required this.count, required this.goLabel});

  final int count;
  final String goLabel;

  @override
  Widget build(BuildContext context) {
    if (count > 3) {
      return Enter(
        fx: Fx.pop,
        delay: const Duration(milliseconds: 300),
        child: Container(
          width: 120.r,
          height: 120.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.tx,
            shape: BoxShape.circle,
            boxShadow: AppShadows.sh2,
          ),
          child: Text('VS', style: AppText.bigInitial(44, AppColors.bg)),
        ),
      );
    }
    if (count > 0) {
      return Enter(
        key: ValueKey(count),
        fx: Fx.pop,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.s1,
            shape: BoxShape.circle,
            boxShadow: AppShadows.sh2,
          ),
          child: CountdownRing(
            size: 170.r,
            width: 11.5.r,
            progress: count / 3,
            color: AppColors.pri,
            child: Text('$count', style: AppText.countdown(84)),
          ),
        ),
      );
    }
    return Enter(
      fx: Fx.pop,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.pri,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.tint(AppColors.pri, .5),
              offset: const Offset(0, 20),
              blurRadius: 60,
            ),
          ],
        ),
        child: Text(goLabel, style: AppText.goBadge),
      ),
    );
  }
}
