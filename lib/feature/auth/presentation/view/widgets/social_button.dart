import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.iconWidth,
    required this.background,
    required this.foreground,
    required this.onTap,
    this.border,
  });

  final String label;
  final String icon;
  final double iconWidth;
  final Color background;
  final Color foreground;
  final Color? border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: onTap,
      child: Container(
        height: 58.r,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(999.r),
          border: border == null ? null : Border.all(color: border!),
          boxShadow: AppShadows.sh1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: iconWidth, height: 22.r),
            SizedBox(width: 12.w),
            Text(label, style: AppText.social.copyWith(color: foreground)),
          ],
        ),
      ),
    );
  }
}
