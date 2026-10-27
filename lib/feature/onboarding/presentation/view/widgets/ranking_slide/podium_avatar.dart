import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/line_icon.dart';
import 'package:flutter/material.dart';

class PodiumAvatar extends StatelessWidget {
  const PodiumAvatar({
    super.key,
    required this.initial,
    required this.size,
    required this.fill,
    required this.onFill,
    required this.ring,
    required this.crowned,
  });

  final String initial;
  final double size;
  final Color fill;
  final Color onFill;
  final Color ring;
  final bool crowned;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: fill,
            shape: BoxShape.circle,
            border: Border.all(color: ring, width: 2.5),
            boxShadow: [BoxShadow(color: AppColors.tint(ring, .45), blurRadius: 16)],
          ),
          child: Text(
            initial,
            style: (crowned ? AppText.avatarLarge : AppText.avatarSmall)
                .copyWith(color: onFill),
          ),
        ),
        if (crowned)
          Positioned(
            top: -22,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: AppColors.tint(AppColors.gold, .5), blurRadius: 10),
                ],
              ),
              child: const LineIcon(AppIcons.crown, color: AppColors.gold),
            ),
          ),
      ],
    );
  }
}
