import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClubSlot extends StatelessWidget {
  const ClubSlot({
    super.key,
    required this.number,
    required this.shown,
    required this.current,
    this.name = '',
    this.year = '',
    this.logo = '',
    this.color = 0,
  });

  final int number;
  final bool shown;
  final bool current;
  final String name;
  final String year;
  final String logo;
  final int color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 40.r, maxHeight: 52.r),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            start: -24,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 12.r,
                height: 12.r,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.m4, width: 2.5),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 550),
              child: shown
                  ? Container(
                      key: const ValueKey(true),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: AppColors.s1,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: current ? AppColors.m4 : AppColors.line,
                          width: 1.5,
                        ),
                        boxShadow: current
                            ? [
                                BoxShadow(
                                  color: AppColors.tint(AppColors.m4, .15),
                                  spreadRadius: 4,
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38.r,
                            height: 38.r,
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(color),
                                width: 1.5,
                              ),
                            ),
                            child: Image.asset(
                              logo,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(child: Text(name, style: AppText.clubName)),
                          Text(year, style: AppText.clubYear),
                        ],
                      ),
                    )
                  : Container(
                      key: const ValueKey(false),
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColors.line2, width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.tr(
                              AppStrings.clubNumber,
                              args: ['$number'],
                            ),
                            style: AppText.hiddenClub,
                          ),
                          Text('؟', style: AppText.hiddenMark),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
