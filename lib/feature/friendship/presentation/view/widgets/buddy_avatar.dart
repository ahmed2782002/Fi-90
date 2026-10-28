import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class BuddyAvatar extends StatelessWidget {
  const BuddyAvatar({
    super.key,
    required this.initial,
    required this.background,
    required this.foreground,
    this.dot,
  });

  final String initial;
  final Color background;
  final Color foreground;
  final Color? dot;

  @override
  Widget build(BuildContext context) {
    final status = dot;
    return Stack(
      children: [
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: Text(initial, style: AppText.buddyInitial(foreground)),
        ),
        if (status != null)
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: status,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.s1, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
