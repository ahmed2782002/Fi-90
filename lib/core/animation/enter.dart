import 'dart:async';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import 'fx.dart';

class Enter extends StatefulWidget {
  const Enter({
    super.key,
    required this.fx,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.curve = Curves.ease,
    this.fade = true,
  });

  final bool fade;

  final Fx fx;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Widget child;

  @override
  State<Enter> createState() => EnterState();
}

class EnterState extends State<Enter> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: widget.duration);

  Timer? _delay;

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _c.forward();
    } else {
      _delay = Timer(widget.delay, _c.forward);
    }
  }

  @override
  void dispose() {
    _delay?.cancel();
    _c.dispose();
    super.dispose();
  }

  bool get _popFirstHalf => _c.value < .6;

  double get _eased => widget.fx == Fx.pop
      ? widget.curve.transform(
          _popFirstHalf ? _c.value / .6 : (_c.value - .6) / .4)
      : widget.curve.transform(_c.value);

  double get _opacity => !widget.fade ? 1.0 : switch (widget.fx) {
        Fx.growUp => 1.0,
        Fx.pop => _popFirstHalf ? _eased : 1.0,
        _ => _eased,
      }
          .clamp(0.0, 1.0);

  Offset get _offset => switch (widget.fx) {
        Fx.fadeUp => const Offset(0, 14),
        Fx.slideS => const Offset(60, 0),
        Fx.slideE => const Offset(-60, 0),
        Fx.riseIn => const Offset(0, 40),
        _ => Offset.zero,
      } *
      (1 - _eased);

  double get _scale => widget.fx != Fx.pop
      ? 1
      : _popFirstHalf
          ? lerpDouble(.6, 1.07, _eased)!
          : lerpDouble(1.07, 1, _eased)!;

  double get _scaleY => widget.fx == Fx.growUp ? _eased : _scale;

  Matrix4 get _matrix => Matrix4.identity()
    ..translateByDouble(_offset.dx, _offset.dy, 0, 1)
    ..scaleByDouble(_scale, _scaleY, 1, 1);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      child: widget.child,
      builder: (context, child) => Opacity(
        opacity: _opacity,
        child: Transform(
          alignment: widget.fx == Fx.growUp
              ? Alignment.bottomCenter
              : Alignment.center,
          transform: _matrix,
          child: child,
        ),
      ),
    );
  }
}
