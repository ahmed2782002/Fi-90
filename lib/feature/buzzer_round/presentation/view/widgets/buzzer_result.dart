import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

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
            width: 116,
            height: 116,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              border: Border.all(color: color, width: 3),
            ),
            child: Text(mark, style: AppText.resultMark(color)),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppText.resultTitle(color),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
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
