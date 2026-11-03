import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideLayout extends StatelessWidget {
  const SlideLayout({
    super.key,
    required this.illustration,
    required this.title,
    required this.body,
  });

  final Widget illustration;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(width: 346.r, height: 340.r, child: illustration),
          ),
        ),
        SizedBox(height: 26.h),
        Enter(
          fx: Fx.fadeUp,
          delay: const Duration(milliseconds: 150),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppText.slideTitle,
              ),
              SizedBox(height: 10.h),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300.r),
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: AppText.slideBody,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
