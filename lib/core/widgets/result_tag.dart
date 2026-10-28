import 'package:flutter/material.dart';

import '../theme/app_text.dart';

class ResultTag extends StatelessWidget {
  const ResultTag({
    super.key,
    required this.label,
    required this.color,
    required this.background,
  });

  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: AppText.resultTag(color)),
    );
  }
}
