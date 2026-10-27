import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot(this.color, {super.key, this.size = 7, this.glow = false});

  final Color color;
  final double size;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: glow ? [BoxShadow(color: color, blurRadius: 8)] : null,
      ),
    );
  }
}
