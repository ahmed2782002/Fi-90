import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuzzerResult extends StatelessWidget {
  const BuzzerResult({
    super.key,
    required this.mark,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final String mark;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Enter(
          fx: Fx.pop,
          duration: const Duration(milliseconds: 450),
          child: Container(
            width: 116.r,
            height: 116.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38.r),
              border: Border.all(color: color, width: 3),
            ),
            child: Text(mark, style: AppText.resultMark(color)),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppText.resultTitle(color),
        ),
        SizedBox(height: 12.h),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280.r),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppText.resultSub,
          ),
        ),
      ],
    );
  }
}
