import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import 'press_scale.dart';

class PillSegment extends StatelessWidget {
  PillSegment({
    super.key,
    required this.labels,
    required this.index,
    required this.onSelect,
    required this.style,
    required this.activeShadow,
    this.activeGradient,
    this.activeColor,
    this.activeText = AppColors.white,
    double? height,
    double? padding,
    double? itemPadding,
    this.expand = false,
  }) : height = height ?? 34.r,
       padding = padding ?? 3.r,
       itemPadding = itemPadding ?? 13.w;

  final List<String> labels;
  final int index;
  final ValueChanged<int> onSelect;
  final TextStyle Function(Color color) style;
  final List<BoxShadow> activeShadow;
  final Gradient? activeGradient;
  final Color? activeColor;
  final Color activeText;
  final double height;
  final double padding;
  final double itemPadding;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.s2,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        children: [
          for (var i = 0; i < labels.length; i++)
            Flexible(
              fit: expand ? FlexFit.tight : FlexFit.loose,
              child: PressScale(
                onTap: () => onSelect(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: height,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: itemPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999.r),
                    gradient: i == index ? activeGradient : null,
                    color: i == index ? activeColor : null,
                    boxShadow: i == index ? activeShadow : const [],
                  ),
                  child: Text(
                    labels[i],
                    style: style(i == index ? activeText : AppColors.mu),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
