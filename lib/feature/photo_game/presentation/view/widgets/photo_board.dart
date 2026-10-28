import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/photo_game/mock_model/lineup_player.dart';
import 'package:flutter/material.dart';

class PhotoBoard extends StatelessWidget {
  const PhotoBoard({super.key, required this.spots, this.reveal = false});

  final List<({LineupPlayer player, int? by})> spots;
  final bool reveal;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2986 / 1716,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.photoBase,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.line2, width: 1.5),
          boxShadow: AppShadows.sh1,
        ),
        child: LayoutBuilder(
          builder: (context, box) => Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                LineupPlayer.photoUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    Image.asset(AppImages.gamePhoto, fit: BoxFit.cover),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, .22, .74, 1],
                    colors: [
                      AppColors.tint(AppColors.groundShadow, .55),
                      AppColors.transparent,
                      AppColors.transparent,
                      AppColors.tint(AppColors.groundShadow, .6),
                    ],
                  ),
                ),
              ),
              for (final (:player, :by) in spots)
                Positioned(
                  left: player.x * box.maxWidth,
                  top: (player.back ? .04 : .84) * box.maxHeight,
                  child: FractionalTranslation(
                    translation: const Offset(-.5, 0),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 74),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: by != null
                            ? AppColors.player(by).fill
                            : AppColors.tint(
                                AppColors.photoBase,
                                reveal ? .88 : .7,
                              ),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: AppColors.tint(AppColors.white, .25),
                        ),
                      ),
                      child: Text(
                        by != null || reveal ? player.short.of(context) : '؟',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.photoTag(
                          by != null
                              ? AppColors.player(by).on
                              : reveal
                              ? AppColors.compareBad
                              : AppColors.m4,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
