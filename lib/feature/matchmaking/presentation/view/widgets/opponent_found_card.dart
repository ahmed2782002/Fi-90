import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class OpponentFoundCard extends StatelessWidget {
  const OpponentFoundCard({
    super.key,
    required this.title,
    required this.name,
    required this.initial,
    required this.details,
  });

  final String title;
  final String name;
  final String initial;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Enter(
          fx: Fx.pop,
          child: Text(title, style: AppText.display(24)),
        ),
        const SizedBox(height: 14),
        Enter(
          fx: Fx.slideE,
          delay: const Duration(milliseconds: 150),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.op, width: 1.5),
              boxShadow: AppShadows.sh2,
            ),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.op,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    initial,
                    style: AppText.bigInitial(24, AppColors.opOn),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: AppText.cardHeading),
                      Text(details, style: AppText.cardCaption),
                    ],
                  ),
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: AppColors.ok,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('48ms', style: AppText.latency),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
