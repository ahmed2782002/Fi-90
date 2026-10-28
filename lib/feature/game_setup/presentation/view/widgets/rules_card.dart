import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class RulesCard extends StatelessWidget {
  const RulesCard({
    super.key,
    required this.title,
    required this.rules,
    required this.accent,
    required this.ink,
  });

  final String title;
  final List<String> rules;
  final Color accent;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Text(title, style: AppText.listHeader),
          for (final (i, rule) in rules.indexed)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.only(top: 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.tint(accent, .16),
                    shape: BoxShape.circle,
                  ),
                  child: Text('${i + 1}', style: AppText.ruleNumber(ink)),
                ),
                Expanded(child: Text(rule, style: AppText.ruleBody)),
              ],
            ),
        ],
      ),
    );
  }
}
