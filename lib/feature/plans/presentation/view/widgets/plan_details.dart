import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class PlanDetails extends StatelessWidget {
  const PlanDetails({
    super.key,
    required this.name,
    required this.nameColor,
    required this.tag,
    required this.price,
    required this.per,
    required this.features,
  });

  final String name;
  final Color nameColor;
  final String tag;
  final String price;
  final String per;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppText.planName(nameColor)),
                  Text(tag, style: AppText.planTag),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: AppText.planPrice),
                Text(per, style: AppText.planPer),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        for (final feature in features) ...[
          const SizedBox(height: 7),
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.ok, .18),
                  shape: BoxShape.circle,
                ),
                child: Text('✓', style: AppText.featureCheck),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(feature, style: AppText.feature)),
            ],
          ),
        ],
      ],
    );
  }
}
