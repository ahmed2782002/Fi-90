import 'dart:async';

class Scheduler {
  final _timers = <Timer>[];
  Timer? _ticker;

  void after(int milliseconds, void Function() action) {
    _timers.add(Timer(Duration(milliseconds: milliseconds), action));
  }

  void every(Duration period, void Function() action) {
    _ticker?.cancel();
    _ticker = Timer.periodic(period, (_) => action());
  }

  void stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  void clearTimers() {
    for (final timer in _timers) {
      timer.cancel();
    }
    _timers.clear();
  }

  void cancel() {
    for (final timer in _timers) {
      timer.cancel();
    }
    _timers.clear();
    stopTicker();
  }
}
