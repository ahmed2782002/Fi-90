import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_icons.dart';
import '../theme/app_colors.dart';

class ForwardChevron extends StatelessWidget {
  ForwardChevron({super.key, double? size, this.color}) : size = size ?? 18.r;

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: Directionality.of(context) == TextDirection.ltr,
      child: SvgPicture.asset(
        AppIcons.chevronBack,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color ?? AppColors.dim, BlendMode.srcIn),
      ),
    );
  }
}
