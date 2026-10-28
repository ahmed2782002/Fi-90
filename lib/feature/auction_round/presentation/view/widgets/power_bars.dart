import 'dart:math';

import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class PowerBars extends StatelessWidget {
  const PowerBars({super.key, required this.title, required this.rows});

  final String title;
  final List<({String label, int me, int opp})> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: AppText.listHeader),
          for (final r in rows) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    '${r.me}',
                    textAlign: TextAlign.center,
                    style: AppText.powerValue(AppColors.meInk),
                  ),
                ),
                const SizedBox(width: 8),
                for (final (i, (value, color, align)) in [
                  (r.me, AppColors.me, AlignmentDirectional.centerStart),
                  (r.opp, AppColors.op, AlignmentDirectional.centerEnd),
                ].indexed) ...[
                  if (i == 1)
                    SizedBox(
                      width: 54,
                      child: Text(
                        r.label,
                        textAlign: TextAlign.center,
                        style: AppText.powerLabel,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      height: 8,
                      alignment: align,
                      decoration: BoxDecoration(
                        color: AppColors.s3,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: value / max(1, max(r.me, r.opp)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 8),
                SizedBox(
                  width: 40,
                  child: Text(
                    '${r.opp}',
                    textAlign: TextAlign.center,
                    style: AppText.powerValue(AppColors.opInk),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
