import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TilePainter extends CustomPainter {
  TilePainter(this.info);

  final PictureInfo info;

  @override
  void paint(Canvas canvas, Size size) {
    final tw = info.size.width, th = info.size.height;
    canvas.clipRect(Offset.zero & size);
    for (double y = 0; y < size.height; y += th) {
      for (double x = 0; x < size.width; x += tw) {
        canvas.save();
        canvas.translate(x, y);
        canvas.drawPicture(info.picture);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(TilePainter old) => old.info != info;
}
