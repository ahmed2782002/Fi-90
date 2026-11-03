import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerBoard extends StatelessWidget {
  const AnswerBoard({
    super.key,
    required this.title,
    required this.emptyHint,
    required this.answers,
    this.overlay,
  });

  final String title;
  final String emptyHint;
  final List<({String name, Color dot})> answers;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    final layer = overlay;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: AppText.boardTitle),
                SizedBox(height: 10.h),
                if (answers.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    child: Text(
                      emptyHint,
                      textAlign: TextAlign.center,
                      style: AppText.boardHint,
                    ),
                  ),
                Wrap(
                  spacing: 6.r,
                  runSpacing: 6.r,
                  children: [
                    for (final a in answers)
                      Enter(
                        fx: Fx.pop,
                        duration: const Duration(milliseconds: 350),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 11.w,
                            vertical: 7.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.s1,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.line),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8.r,
                                height: 8.r,
                                decoration: BoxDecoration(
                                  color: a.dot,
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                              ),
                              SizedBox(width: 7.w),
                              Text(a.name, style: AppText.boardChip),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (layer != null) Positioned.fill(child: layer),
        ],
      ),
    );
  }
}
