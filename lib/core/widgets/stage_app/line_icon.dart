import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineIcon extends StatelessWidget {
  const LineIcon(this.asset, {super.key, required this.color, this.size = 26});

  final String asset;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      theme: SvgTheme(currentColor: color),
    );
  }
}
