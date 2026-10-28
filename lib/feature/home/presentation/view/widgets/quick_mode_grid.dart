import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/feature/home/mock_model/quick_mode.dart';
import 'package:fii90/feature/home/presentation/view/widgets/quick_mode_card.dart';
import 'package:flutter/material.dart';

class QuickModeGrid extends StatelessWidget {
  const QuickModeGrid({super.key, required this.modes, required this.onSelect});

  final List<QuickMode> modes;
  final ValueChanged<QuickMode> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var row = 0; row < modes.length; row += 2) ...[
          if (row > 0) const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = row; i < row + 2 && i < modes.length; i++) ...[
                  if (i > row) const SizedBox(width: 10),
                  Expanded(
                    child: QuickModeCard(
                      title: context.tr(modes[i].titleKey),
                      hint: context.tr(modes[i].hintKey),
                      image: modes[i].image,
                      accent: modes[i].accent,
                      glow: modes[i].glow,
                      contain: modes[i].contain,
                      onTap: () => onSelect(modes[i]),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}
