import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'tile_painter.dart';

class TiledSvg extends StatefulWidget {
  const TiledSvg({super.key, required this.asset, required this.opacity});

  final String asset;
  final double opacity;

  static final Map<String, Future<PictureInfo>> _loading = {};
  static final Map<String, PictureInfo> _ready = {};

  static Future<PictureInfo> precache(String asset) {
    return _loading.putIfAbsent(
      asset,
      () => vg.loadPicture(SvgAssetLoader(asset), null).then((info) => _ready[asset] = info),
    );
  }

  @override
  State<TiledSvg> createState() => TiledSvgState();
}

class TiledSvgState extends State<TiledSvg> {
  late PictureInfo? _info = TiledSvg._ready[widget.asset];

  @override
  void initState() {
    super.initState();
    if (_info != null) return;
    TiledSvg.precache(widget.asset).then((info) {
      if (mounted) setState(() => _info = info);
    });
  }

  @override
  Widget build(BuildContext context) {
    final info = _info;
    if (info == null) return const SizedBox.expand();
    return IgnorePointer(
      child: RepaintBoundary(
        child: Opacity(
          opacity: widget.opacity,
          child: CustomPaint(size: Size.infinite, painter: TilePainter(info)),
        ),
      ),
    );
  }
}
