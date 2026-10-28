import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';

class ScoreChip extends StatelessWidget {
  const ScoreChip({
    super.key,
    required this.name,
    required this.initial,
    required this.score,
    required this.fill,
    required this.onFill,
    required this.active,
    required this.turnLabel,
    this.delta,
    this.mirrored = false,
  });

  final String name;
  final String initial;
  final int score;
  final Color fill;
  final Color onFill;
  final bool active;
  final String turnLabel;
  final String? delta;
  final bool mirrored;

  @override
  Widget build(BuildContext context) {
    final gain = delta;
    final avatar = Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(initial, style: AppText.hudInitial(onFill)),
    );
    final info = Flexible(
      child: Column(
        crossAxisAlignment: mirrored
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.hudName,
          ),
          Text('$score', style: AppText.hudScore),
        ],
      ),
    );
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
            decoration: BoxDecoration(
              color: active
                  ? AppColors.mix(fill, .16, AppColors.s1)
                  : AppColors.s1,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: active ? fill : AppColors.line,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: mirrored
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: mirrored
                  ? [info, const SizedBox(width: 8), avatar]
                  : [avatar, const SizedBox(width: 8), info],
            ),
          ),
          if (active)
            PositionedDirectional(
              top: -9,
              start: mirrored ? 8 : null,
              end: mirrored ? null : 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: fill,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(turnLabel, style: AppText.turnTag(onFill)),
              ),
            ),
          if (gain != null)
            PositionedDirectional(
              bottom: 6,
              start: mirrored ? 10 : null,
              end: mirrored ? null : 10,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 1500),
                builder: (context, t, child) => Opacity(
                  opacity: t < .2 ? t * 5 : 1 - t,
                  child: Transform.translate(
                    offset: Offset(0, 6 - 36 * t),
                    child: child,
                  ),
                ),
                child: Text(
                  gain,
                  textDirection: TextDirection.ltr,
                  style: AppText.scoreDelta,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
