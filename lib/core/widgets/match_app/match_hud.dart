import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'score_chip.dart';

class MatchHud extends StatelessWidget {
  const MatchHud({
    super.key,
    required this.meName,
    required this.meInitial,
    required this.meScore,
    required this.oppName,
    required this.oppInitial,
    required this.oppScore,
    required this.modeName,
    required this.modeInk,
    required this.dots,
    required this.meTurnLabel,
    required this.oppTurnLabel,
    this.meTurn = false,
    this.oppTurn = false,
    this.meDelta,
    this.oppDelta,
  });

  final String meName;
  final String meInitial;
  final int meScore;
  final String oppName;
  final String oppInitial;
  final int oppScore;
  final String modeName;
  final Color modeInk;
  final List<({Color color, bool active})> dots;
  final String meTurnLabel;
  final String oppTurnLabel;
  final bool meTurn;
  final bool oppTurn;
  final String? meDelta;
  final String? oppDelta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
      child: Row(
        children: [
          ScoreChip(
            name: meName,
            initial: meInitial,
            score: meScore,
            fill: AppColors.me,
            onFill: AppColors.meOn,
            active: meTurn,
            turnLabel: meTurnLabel,
            delta: meDelta,
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 78),
            child: Column(
              children: [
                Text(modeName, style: AppText.hudMode(modeInk)),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final d in dots) ...[
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: d.active ? 18 : 6,
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 1.5),
                        decoration: BoxDecoration(
                          color: d.color,
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.okInk,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text('42ms', style: AppText.ping),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ScoreChip(
            name: oppName,
            initial: oppInitial,
            score: oppScore,
            fill: AppColors.op,
            onFill: AppColors.opOn,
            active: oppTurn,
            turnLabel: oppTurnLabel,
            delta: oppDelta,
            mirrored: true,
          ),
        ],
      ),
    );
  }
}
