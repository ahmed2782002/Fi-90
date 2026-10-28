import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/pill_segment.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:flutter/material.dart';

class AiLevelPicker extends StatelessWidget {
  const AiLevelPicker({
    super.key,
    required this.level,
    required this.onSelect,
    required this.onStart,
  });

  final AiLevel level;
  final ValueChanged<int> onSelect;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Enter(
      fx: Fx.fadeIn,
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            PillSegment(
              labels: [for (final l in AiLevel.values) context.tr(l.labelKey)],
              index: level.index,
              onSelect: onSelect,
              style: AppText.segment,
              activeGradient: AppColors.grad,
              activeShadow: AppShadows.segment,
              height: 38,
              padding: 4,
              expand: true,
            ),
            Text(
              context.tr(level.hintKey),
              textAlign: TextAlign.center,
              style: AppText.statusLine,
            ),
            PrimaryButton(
              label: context.tr(AppStrings.startVsAi),
              onTap: onStart,
              height: 54,
            ),
          ],
        ),
      ),
    );
  }
}
