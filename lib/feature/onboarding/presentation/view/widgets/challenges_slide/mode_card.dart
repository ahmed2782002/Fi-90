import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/line_icon.dart';
import 'package:flutter/material.dart';

class ModeCard extends StatelessWidget {
  const ModeCard({
    super.key,
    required this.number,
    required this.icon,
    required this.color,
    required this.ink,
  });

  final String number;
  final String icon;
  final Color color;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 176,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color, width: 1.5),
        gradient: LinearGradient(
          begin: const Alignment(-.09, -1),
          end: const Alignment(.09, 1),
          colors: [AppColors.mix(color, .34, AppColors.s1), AppColors.s1],
          stops: const [0, .62],
        ),
        boxShadow: [
          BoxShadow(color: AppColors.tint(color, .3), blurRadius: 18),
          ...AppShadows.sh2,
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            top: -6,
            end: 8,
            child: Text(
              number,
              style: AppText.modeNumber.copyWith(color: color.withValues(alpha: .18)),
            ),
          ),
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.tint(color, .22),
              borderRadius: BorderRadius.circular(16),
            ),
            child: LineIcon(icon, color: ink),
          ),
        ],
      ),
    );
  }
}
