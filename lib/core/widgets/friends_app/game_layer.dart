import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_background/app_background.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameLayer extends StatelessWidget {
  const GameLayer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.overlay,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    final top = overlay;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: AppBackground(
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 9, 16, 10),
                    child: Row(
                      children: [
                        Semantics(
                          button: true,
                          label: context.tr(AppStrings.exitGame),
                          child: PressScale(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: 42,
                              height: 42,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.s1,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.line2),
                              ),
                              child: Transform.flip(
                                flipX:
                                    Directionality.of(context) ==
                                    TextDirection.ltr,
                                child: SvgPicture.asset(
                                  AppIcons.back,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.tx,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: AppText.gameLayerTitle),
                              if (subtitle.isNotEmpty)
                                Text(
                                  subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppText.gameSubtitle,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
                      children: [
                        for (final (i, child) in children.indexed) ...[
                          if (i > 0) const SizedBox(height: 12),
                          child,
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ?top,
          ],
        ),
      ),
    );
  }
}
