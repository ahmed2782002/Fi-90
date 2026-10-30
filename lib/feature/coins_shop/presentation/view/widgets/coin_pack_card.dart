import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class CoinPackCard extends StatelessWidget {
  const CoinPackCard({
    super.key,
    required this.amount,
    required this.price,
    required this.coinSize,
    required this.onTap,
    this.bonus,
    this.tag,
    this.tagColor = AppColors.transparent,
    this.tagInk = AppColors.transparent,
    this.tagGlow = 0,
  });

  final String amount;
  final String price;
  final double coinSize;
  final VoidCallback onTap;
  final String? bonus;
  final String? tag;
  final Color tagColor;
  final Color tagInk;
  final double tagGlow;

  @override
  Widget build(BuildContext context) {
    final label = tag;
    final gift = bonus;
    return PressScale(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 16, 10, 12),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(26),
              border: label == null
                  ? Border.all(color: AppColors.line)
                  : Border.all(color: tagColor, width: 1.5),
              boxShadow: [
                if (label != null)
                  BoxShadow(
                    color: AppColors.tint(tagColor, tagGlow),
                    blurRadius: 16,
                  ),
                ...AppShadows.sh1,
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 4),
                Container(
                  width: coinSize,
                  height: coinSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.tint(AppColors.goldGlow, .4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: const Image(image: AssetImage(AppImages.coin90)),
                ),
                const SizedBox(height: 6),
                Text(
                  amount,
                  textDirection: TextDirection.ltr,
                  style: AppText.packAmount,
                ),
                if (gift != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tint(AppColors.ok, .16),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(gift, style: AppText.packBonus),
                  ),
                ],
                const SizedBox(height: 10),
                Container(
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: AppColors.grad,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.neon, width: 1.5),
                    boxShadow: AppShadows.glow,
                  ),
                  child: Text(price, style: AppText.actionButton(13)),
                ),
              ],
            ),
          ),
          if (label != null)
            Positioned(
              top: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(label, style: AppText.packTag(tagInk)),
              ),
            ),
        ],
      ),
    );
  }
}
