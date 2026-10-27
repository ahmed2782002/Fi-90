import 'package:fii90/core/animation/bob.dart';
import 'package:flutter/material.dart';

class FloatingPerk extends StatelessWidget {
  const FloatingPerk({
    super.key,
    required this.delay,
    required this.child,
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  final int delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: LayoutBuilder(
        builder: (context, box) => Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: top == null ? null : top! * box.maxHeight,
              bottom: bottom == null ? null : bottom! * box.maxHeight,
              start: start == null ? null : start! * box.maxWidth,
              end: end == null ? null : end! * box.maxWidth,
              child: Bob(
                distance: 8,
                period: const Duration(milliseconds: 3200),
                delay: Duration(milliseconds: delay),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
