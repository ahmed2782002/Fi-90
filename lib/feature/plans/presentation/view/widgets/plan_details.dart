import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: AppText.planPrice),
                Text(per, style: AppText.planPer),
              ],
            ),
          ],
        ),
        SizedBox(height: 5.h),
        for (final feature in features) ...[
          SizedBox(height: 7.h),
          Row(
            children: [
              Container(
                width: 18.r,
                height: 18.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.ok, .18),
                  shape: BoxShape.circle,
                ),
                child: Text('✓', style: AppText.featureCheck),
              ),
              SizedBox(width: 8.w),
              Expanded(child: Text(feature, style: AppText.feature)),
            ],
          ),
        ],
      ],
    );
  }
}
