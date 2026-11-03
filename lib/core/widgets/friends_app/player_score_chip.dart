import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerScoreChip extends StatelessWidget {
  const PlayerScoreChip({
    super.key,
    required this.name,
    required this.value,
    required this.caption,
    required this.palette,
    this.active = false,
    this.out = false,
    this.dots = const [],
  });

  final String name;
  final int value;
  final String caption;
  final PlayerPalette palette;
  final bool active;
  final bool out;
  final List<bool> dots;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: out ? .55 : 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: active ? palette.fill : AppColors.line,
            width: 1.5,
          ),
          boxShadow: AppShadows.sh1,
        ),
        child: Row(
          spacing: 8.r,
          children: [
            Container(
              width: 30.r,
              height: 30.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: palette.fill,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                name.isEmpty ? '؟' : name.characters.first,
                style: AppText.bigInitial(13, palette.on),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.r,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.chipName,
                  ),
                  if (dots.isNotEmpty)
                    Row(
                      spacing: 3.r,
                      children: [
                        for (final d in dots)
                          Container(
                            width: 7.r,
                            height: 7.r,
                            decoration: BoxDecoration(
                              color: d ? AppColors.bad : AppColors.s3,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  Text(caption, maxLines: 1, style: AppText.chipCaption),
                ],
              ),
            ),
            Text('$value', style: AppText.chipValue(palette.ink)),
          ],
        ),
      ),
    );
  }
}
