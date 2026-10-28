import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class VsPlayerBanner extends StatelessWidget {
  const VsPlayerBanner({
    super.key,
    required this.name,
    required this.initial,
    required this.level,
    required this.tier,
    required this.fill,
    required this.onFill,
    this.mirrored = false,
  });

  final String name;
  final String initial;
  final String level;
  final String tier;
  final Color fill;
  final Color onFill;
  final bool mirrored;

  @override
  Widget build(BuildContext context) {
    final tags = [(level, AppColors.tx), (tier, AppColors.goldInk)];
    final avatar = Container(
      width: 104,
      height: 104,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(32),
        boxShadow: AppShadows.sh2,
      ),
      child: Text(initial, style: AppText.bigInitial(46, onFill)),
    );
    final info = Column(
      crossAxisAlignment: mirrored
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(name, style: AppText.vsName),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final (text, color) in mirrored ? tags.reversed : tags)
              Container(
                margin: const EdgeInsetsDirectional.only(end: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.glass,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(text, style: AppText.vsTag(color)),
              ),
          ],
        ),
      ],
    );
    return Enter(
      fx: mirrored ? Fx.slideE : Fx.slideS,
      duration: const Duration(milliseconds: 600),
      child: Row(
        mainAxisAlignment: mirrored
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: mirrored
            ? [info, const SizedBox(width: 16), avatar]
            : [avatar, const SizedBox(width: 16), info],
      ),
    );
  }
}
