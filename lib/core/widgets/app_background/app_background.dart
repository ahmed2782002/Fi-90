import 'package:flutter/material.dart';

import '../../constants/app_images.dart';
import '../../theme/app_colors.dart';
import '../../theme/gradients.dart';
import 'tiled_svg.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.bg,
        gradient: AppGradients.fade(
          AppColors.bg2,
          x: .5,
          y: 0,
          rx: .9,
          ry: .4,
          alpha: 1,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          TiledSvg(
            asset: AppImages.patternTile,
            opacity: AppColors.patternOpacity,
          ),
          child,
        ],
      ),
    );
  }
}
