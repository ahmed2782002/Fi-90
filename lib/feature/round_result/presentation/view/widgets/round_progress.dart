import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundProgress extends StatelessWidget {
  const RoundProgress({super.key, required this.modes, required this.current});

  final List<MatchMode> modes;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < modes.length; i++) ...[
          if (i > 0) SizedBox(width: 6.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 9.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: i <= current ? modes[i].accent : AppColors.s2,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                context.tr(modes[i].nameKey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.progressChip(
                  i <= current ? modes[i].onAccent : AppColors.mu,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
