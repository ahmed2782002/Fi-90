import 'package:audioplayers/audioplayers.dart';

abstract final class AppSfx {
  // Paths are relative to `assets/`, as AudioCache expects.
  static const _bell = 'sounds/bell.wav';

  static final _player = AudioPlayer()
    ..setPlayerMode(PlayerMode.lowLatency)
    ..setReleaseMode(ReleaseMode.stop);

  static Future<void> bell() async {
    try {
      await _player.stop();
      await _player.play(AssetSource(_bell));
    } catch (_) {
      // A missing sound must never break the round.
    }
  }
}
