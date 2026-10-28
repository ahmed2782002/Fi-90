import 'package:fii90/core/widgets/app_toast/toast_message.dart';

class GameSetupState {
  const GameSetupState({
    this.pairs = false,
    this.players = const [],
    this.version = 0,
    this.launch = false,
    this.toast,
  });

  final bool pairs;
  final List<String> players;
  final int version;
  final bool launch;
  final ToastMessage? toast;

  GameSetupState copyWith({
    bool? pairs,
    List<String>? players,
    int? version,
    bool? launch,
    ToastMessage? toast,
  }) => GameSetupState(
    pairs: pairs ?? this.pairs,
    players: players ?? this.players,
    version: version ?? this.version,
    launch: launch ?? false,
    toast: toast,
  );
}
