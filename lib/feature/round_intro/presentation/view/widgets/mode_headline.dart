import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModeHeadline extends StatelessWidget {
  const ModeHeadline({
    super.key,
    required this.icon,
    required this.name,
    required this.hook,
    required this.accent,
    required this.ink,
  });

  final String icon;
  final String name;
  final String hook;
  final Color accent;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Enter(
          fx: Fx.pop,
          child: Container(
            width: 92,
            height: 92,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(34),
              boxShadow: [
                BoxShadow(
                  color: AppColors.tint(accent, .4),
                  offset: const Offset(0, 18),
                  blurRadius: 40,
                ),
              ],
            ),
            child: SvgPicture.asset(
              icon,
              width: 52,
              height: 52,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Enter(
          fx: Fx.fadeUp,
          delay: const Duration(milliseconds: 100),
          child: Text(name, style: AppText.display(48, color: ink)),
        ),
        const SizedBox(height: 20),
        Enter(
          fx: Fx.fadeUp,
          delay: const Duration(milliseconds: 200),
          child: Text(hook, style: AppText.introHook),
        ),
      ],
    );
  }
}
