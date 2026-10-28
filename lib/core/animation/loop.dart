import 'dart:async';

import 'package:flutter/material.dart';

class Loop extends StatefulWidget {
  const Loop({
    super.key,
    required this.period,
    required this.builder,
    this.delay = Duration.zero,
    this.hideUntilStart = false,
    this.child,
  });

  final Duration period;
  final Duration delay;
  final bool hideUntilStart;
  final Widget? child;
  final Widget Function(BuildContext context, double t, Widget? child) builder;

  @override
  State<Loop> createState() => LoopState();
}

class LoopState extends State<Loop> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.period,
  );
  bool _started = false;
  Timer? _delay;

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _start();
    } else {
      _delay = Timer(widget.delay, () => setState(_start));
    }
  }

  void _start() {
    _started = true;
    _c.repeat();
  }

  @override
  void dispose() {
    _delay?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !_started && widget.hideUntilStart ? 0 : 1,
      child: AnimatedBuilder(
        animation: _c,
        child: widget.child,
        builder: (context, child) => widget.builder(context, _c.value, child),
      ),
    );
  }
}
