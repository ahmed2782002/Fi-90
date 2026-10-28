import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.action,
    required this.actionStyle,
    this.onAction,
  });

  final String title;
  final String action;
  final TextStyle actionStyle;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(child: Text(title, style: AppText.sectionTitle)),
        const SizedBox(width: 12),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onAction,
          child: Text(action, style: actionStyle),
        ),
      ],
    );
  }
}
