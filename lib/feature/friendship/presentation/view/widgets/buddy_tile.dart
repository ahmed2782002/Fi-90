import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/buddy_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuddyTile extends StatelessWidget {
  const BuddyTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.subtitleColor,
    required this.background,
    required this.foreground,
    required this.actions,
    this.dot,
    this.highlighted = false,
  });

  final String name;
  final String subtitle;
  final Color subtitleColor;
  final Color background;
  final Color foreground;
  final List<Widget> actions;
  final Color? dot;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: highlighted ? AppColors.line2 : AppColors.line,
        ),
        boxShadow: AppShadows.sh1,
      ),
      child: Row(
        children: [
          BuddyAvatar(
            initial: name.characters.first,
            background: background,
            foreground: foreground,
            dot: dot,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppText.rowTitle),
                Text(subtitle, style: AppText.buddyStatus(subtitleColor)),
              ],
            ),
          ),
          for (final action in actions) ...[SizedBox(width: 12.w), action],
        ],
      ),
    );
  }
}
