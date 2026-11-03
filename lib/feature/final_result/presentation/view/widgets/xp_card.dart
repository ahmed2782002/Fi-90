import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XpCard extends StatelessWidget {
  const XpCard({
    super.key,
    required this.title,
    required this.xp,
    required this.progress,
    required this.rankLine,
    required this.coins,
  });

  final String title;
  final int xp;
  final double progress;
  final String rankLine;
  final int? coins;

  @override
  Widget build(BuildContext context) {
    final bonus = coins;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: AppText.cardTitle)),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.skewX(-.1763),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '+$xp XP',
                    textDirection: TextDirection.ltr,
                    style: AppText.points(22),
                  ),
                ),
              ),
              if (bonus != null) ...[
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(8.w, 5.h, 12.w, 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.s1,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.gold, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.coin,
                        width: 18.r,
                        height: 18.r,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '+$bonus',
                        textDirection: TextDirection.ltr,
                        style: AppText.coinBonus,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(9.r),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOut,
              builder: (context, value, _) => Container(
                height: 8.r,
                color: AppColors.s3,
                alignment: AlignmentDirectional.centerStart,
                child: FractionallySizedBox(
                  widthFactor: value,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.pri, AppColors.goldGlow],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('LV 24', style: AppText.meta),
              Text(rankLine, style: AppText.meta),
            ],
          ),
        ],
      ),
    );
  }
}
