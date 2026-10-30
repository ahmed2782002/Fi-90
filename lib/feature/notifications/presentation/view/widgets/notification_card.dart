import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.glyph,
    required this.tile,
    required this.ink,
    required this.title,
    required this.time,
    required this.body,
    required this.unread,
    required this.onTap,
    this.tileGradient,
    this.points,
    this.actions,
  });

  final String glyph;
  final Color tile;
  final Color ink;
  final String title;
  final String time;
  final String body;
  final bool unread;
  final VoidCallback onTap;
  final Gradient? tileGradient;
  final String? points;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    final pts = points;
    final actions = this.actions;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: unread
                  ? AppColors.mix(AppColors.cy, .06, AppColors.s1)
                  : AppColors.s1,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: unread ? AppColors.line2 : AppColors.line,
              ),
              boxShadow: AppShadows.sh1,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: tile,
                    gradient: tileGradient,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(glyph, style: AppText.notificationGlyph(ink)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: AppText.notificationTitle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(time, style: AppText.notificationTime),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(body, style: AppText.notificationBody),
                      if (pts != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Transform(
                            transform: Matrix4.skewX(-.175),
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.gold,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Text(
                                pts,
                                textDirection: TextDirection.ltr,
                                style: AppText.notificationPoints,
                              ),
                            ),
                          ),
                        ),
                      if (actions != null) ...[
                        const SizedBox(height: 11),
                        actions,
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (unread)
            PositionedDirectional(
              top: 18,
              start: 8,
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.cy,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: AppColors.cy, blurRadius: 8)],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
