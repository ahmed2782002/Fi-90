import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VsPlayerBanner extends StatelessWidget {
  const VsPlayerBanner({
    super.key,
    required this.name,
    required this.initial,
    required this.level,
    required this.tier,
    required this.fill,
    required this.onFill,
    this.mirrored = false,
  });

  final String name;
  final String initial;
  final String level;
  final String tier;
  final Color fill;
  final Color onFill;
  final bool mirrored;

  @override
  Widget build(BuildContext context) {
    final tags = [(level, AppColors.tx), (tier, AppColors.goldInk)];
    final avatar = Container(
      width: 104.r,
      height: 104.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: AppShadows.sh2,
      ),
      child: Text(initial, style: AppText.bigInitial(46, onFill)),
    );
    final info = Column(
      crossAxisAlignment: mirrored
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(name, style: AppText.vsName),
        SizedBox(height: 6.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final (text, color) in mirrored ? tags.reversed : tags)
              Container(
                margin: EdgeInsetsDirectional.only(end: 6.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.glass,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Text(text, style: AppText.vsTag(color)),
              ),
          ],
        ),
      ],
    );
    return Enter(
      fx: mirrored ? Fx.slideE : Fx.slideS,
      duration: const Duration(milliseconds: 600),
      child: Row(
        mainAxisAlignment: mirrored
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: mirrored
            ? [info, SizedBox(width: 16.w), avatar]
            : [avatar, SizedBox(width: 16.w), info],
      ),
    );
  }
}
