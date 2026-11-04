import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/fut_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LotCard extends StatelessWidget {
  const LotCard({
    super.key,
    required this.position,
    required this.clues,
    required this.revealed,
    required this.pendingLabel,
  });

  final String position;
  final List<String> clues;
  final int revealed;
  final String pendingLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14.w, 16.h, 14.w, 14.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 164.r,
            height: 243.r,
            child: FittedBox(
              child: FutCard(
                palette: AppColors.futMystery,
                rating: '?',
                position: position,
                name: '???',
                initial: '?',
              ),
            ),
          ),
          SizedBox(height: 14.h),
          for (var i = 0; i < clues.length; i++) ...[
            if (i > 0) SizedBox(height: 6.h),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              constraints: BoxConstraints(minHeight: 40.r),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: i < revealed ? AppColors.s2 : null,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: i < revealed ? AppColors.line2 : AppColors.line,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24.r,
                    height: 24.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: i < revealed ? AppColors.gold : AppColors.s3,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: AppText.clueNumber(
                        i < revealed ? AppColors.stickerInk : AppColors.dim,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      i < revealed ? clues[i] : pendingLabel,
                      style: AppText.clueText(
                        i < revealed ? AppColors.tx : AppColors.dim,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
