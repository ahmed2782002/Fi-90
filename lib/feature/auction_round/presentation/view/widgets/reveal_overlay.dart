import 'dart:math' as math;
import 'dart:ui';

import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/fut_card.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';
import 'package:flutter/material.dart';

class RevealOverlay extends StatelessWidget {
  const RevealOverlay({
    super.key,
    required this.tag,
    required this.free,
    required this.message,
    required this.player,
    required this.name,
    required this.flip,
    this.compare,
    this.compareGood = false,
  });

  final String tag;
  final bool free;
  final String message;
  final AuctionPlayer player;
  final String name;
  final int flip;
  final String? compare;
  final bool compareGood;

  @override
  Widget build(BuildContext context) {
    final note = compare;
    final angle = switch (flip) {
      1 => math.pi / 2,
      2 => -math.pi / 2,
      _ => 0.0,
    };
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        color: AppColors.scrim,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: free ? AppColors.ok : AppColors.gold,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                tag,
                style: AppText.revealTag(
                  free ? AppColors.checkInk : AppColors.stickerInk,
                ),
              ),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: AppText.revealMessage,
              ),
            ),
            const SizedBox(height: 14),
            Flexible(
              child: Enter(
                fx: Fx.pop,
                duration: const Duration(milliseconds: 650),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(end: angle),
                  duration: Duration(
                    milliseconds: flip == 2
                        ? 0
                        : flip == 1
                        ? 350
                        : 450,
                  ),
                  curve: flip == 1 ? Curves.easeIn : Curves.easeOutBack,
                  builder: (context, value, child) => Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, .0009)
                      ..rotateY(value),
                    child: child,
                  ),
                  child: FittedBox(
                    child: FutCard(
                      palette: player.palette,
                      rating: '${player.rating}',
                      position: player.position,
                      name: player.card,
                      initial: player.short.of(context).characters.first,
                      statLabels: player.statLabels,
                      statValues: [for (final v in player.stats) '$v'],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(name, style: AppText.revealName),
            if (note != null) ...[
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  note,
                  textAlign: TextAlign.center,
                  style: AppText.feedbackNote(
                    compareGood ? AppColors.compareGood : AppColors.compareBad,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
