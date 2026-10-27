import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TopGloss extends StatelessWidget {
  const TopGloss({super.key, required this.fraction, required this.alpha});

  final double fraction;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          heightFactor: fraction,
          widthFactor: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white.withValues(alpha: alpha),
                  AppColors.white.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
