import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamNamesCard extends StatelessWidget {
  const TeamNamesCard({
    super.key,
    required this.label,
    required this.color,
    required this.fields,
  });

  final String label;
  final Color color;
  final List<({TextEditingController controller, String hint})> fields;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: color, width: 1.5),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8.r,
        children: [
          Row(
            spacing: 8.r,
            children: [
              Container(
                width: 10.r,
                height: 10.r,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              Flexible(child: Text(label, style: AppText.teamLabel)),
            ],
          ),
          for (final f in fields)
            AppTextField(
              controller: f.controller,
              hint: f.hint,
              height: 46.r,
              fontSize: 14.sp,
              weight: FontWeight.w700,
            ),
        ],
      ),
    );
  }
}
