import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class FaqTile extends StatelessWidget {
  const FaqTile({
    super.key,
    required this.question,
    required this.answer,
    required this.open,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool open;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: open ? AppColors.line2 : AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              constraints: const BoxConstraints(minHeight: 58),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(child: Text(question, style: AppText.faqQuestion)),
                  const SizedBox(width: 12),
                  AnimatedRotation(
                    turns: open ? .125 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: open ? null : AppColors.s2,
                        gradient: open ? AppColors.grad : null,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '+',
                        style: AppText.faqIcon(
                          open ? AppColors.white : AppColors.mu,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.topCenter,
            child: open
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(answer, style: AppText.faqAnswer),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}
