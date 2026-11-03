import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_icons.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import '../press_scale.dart';
import 'score_chip.dart';

class MatchHud extends StatelessWidget {
  const MatchHud({
    super.key,
    required this.meName,
    required this.meInitial,
    required this.meScore,
    required this.oppName,
    required this.oppInitial,
    required this.oppScore,
    required this.modeName,
    required this.modeInk,
    required this.dots,
    required this.meTurnLabel,
    required this.oppTurnLabel,
    required this.onInfo,
    this.meTurn = false,
    this.oppTurn = false,
    this.meDelta,
    this.oppDelta,
  });

  final String meName;
  final String meInitial;
  final int meScore;
  final String oppName;
  final String oppInitial;
  final int oppScore;
  final String modeName;
  final Color modeInk;
  final List<({Color color, bool active})> dots;
  final String meTurnLabel;
  final String oppTurnLabel;
  final VoidCallback onInfo;
  final bool meTurn;
  final bool oppTurn;
  final String? meDelta;
  final String? oppDelta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 6.h, 12.w, 10.h),
      child: Row(
        children: [
          ScoreChip(
            name: meName,
            initial: meInitial,
            score: meScore,
            fill: AppColors.me,
            onFill: AppColors.meOn,
            active: meTurn,
            turnLabel: meTurnLabel,
            delta: meDelta,
          ),
          SizedBox(width: 8.w),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 78.r),
            child: Column(
              children: [
                Text(modeName, style: AppText.hudMode(modeInk)),
                SizedBox(height: 5.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final d in dots) ...[
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: d.active ? 18.r : 6.r,
                        height: 5.r,
                        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                        decoration: BoxDecoration(
                          color: d.color,
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                PressScale(
                  onTap: onInfo,
                  child: Container(
                    width: 26.r,
                    height: 26.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.tint(modeInk, .12),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.faq,
                      width: 17.r,
                      height: 17.r,
                      colorFilter: ColorFilter.mode(modeInk, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          ScoreChip(
            name: oppName,
            initial: oppInitial,
            score: oppScore,
            fill: AppColors.op,
            onFill: AppColors.opOn,
            active: oppTurn,
            turnLabel: oppTurnLabel,
            delta: oppDelta,
            mirrored: true,
          ),
        ],
      ),
    );
  }
}
