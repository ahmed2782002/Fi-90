import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupSectionHeader extends StatelessWidget {
  const SetupSectionHeader({
    super.key,
    required this.step,
    required this.title,
    this.hint,
  });

  final int step;
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24.r,
          height: 24.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.goldInk, AppColors.gold],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.tint(AppColors.goldGlow, .35),
                blurRadius: 10,
              ),
            ],
          ),
          child: Text('$step', style: AppText.setupStep),
        ),
        SizedBox(width: 8.w),
        Text(title, style: AppText.setupLabel),
        if (hint != null) ...[
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              hint!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.meta,
            ),
          ),
        ],
      ],
    );
  }
}
