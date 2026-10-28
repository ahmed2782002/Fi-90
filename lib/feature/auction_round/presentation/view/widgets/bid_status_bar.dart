import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class BidStatusBar extends StatelessWidget {
  const BidStatusBar({
    super.key,
    required this.label,
    this.opponent = false,
    this.leading,
  });

  final String label;
  final bool opponent;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final icon = leading;
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: opponent
            ? AppColors.mix(AppColors.op, .1, AppColors.s1)
            : AppColors.s2,
        borderRadius: BorderRadius.circular(999),
        border: opponent ? Border.all(color: AppColors.op, width: 1.5) : null,
      ),
      child: Row(
        mainAxisAlignment: opponent
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon, const SizedBox(width: 8)],
          Flexible(
            child: Text(
              label,
              style: opponent
                  ? AppText.feedbackNote(AppColors.opInk)
                  : AppText.bidWaiting,
            ),
          ),
          if (opponent)
            Row(
              children: [
                for (var i = 0; i < 3; i++)
                  Loop(
                    period: const Duration(milliseconds: 1200),
                    delay: Duration(milliseconds: i * 200),
                    builder: (context, t, child) => Opacity(
                      opacity: t < .4
                          ? .25 + t / .4 * .75
                          : t < .8
                          ? 1 - (t - .4) / .4 * .75
                          : .25,
                      child: child,
                    ),
                    child: Container(
                      width: 7,
                      height: 7,
                      margin: const EdgeInsetsDirectional.only(start: 4),
                      decoration: BoxDecoration(
                        color: AppColors.op,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
