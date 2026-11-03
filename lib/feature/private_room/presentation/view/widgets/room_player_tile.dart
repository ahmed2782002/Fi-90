import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomPlayerTile extends StatelessWidget {
  const RoomPlayerTile({
    super.key,
    required this.initial,
    required this.name,
    required this.level,
    required this.fill,
    required this.onFill,
    required this.ready,
  });

  final String initial;
  final String name;
  final String level;
  final Color fill;
  final Color onFill;
  final bool ready;

  @override
  Widget build(BuildContext context) {
    return Enter(
      fx: Fx.fadeUp,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.tint(fill, .45), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 46.r,
              height: 46.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(initial, style: AppText.bigInitial(20, onFill)),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppText.rowTitle),
                  Text(level, style: AppText.meta),
                ],
              ),
            ),
            if (ready)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.ok, .15),
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Text(
                  context.tr(AppStrings.readyCheck),
                  style: AppText.readyChip,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
