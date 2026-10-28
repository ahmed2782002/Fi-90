import 'package:fii90/core/widgets/app_toast/toast_message.dart';

enum SpyStep { pass, flip, clue, decide, vote, reveal }

class SpyGameState {
  const SpyGameState({
    required this.clues,
    required this.points,
    this.step = SpyStep.pass,
    this.index = 0,
    this.flipped = false,
    this.round = 1,
    this.votes = const [],
    this.selected,
    this.guess,
    this.finished = false,
    this.toast,
  });

  final List<List<String>> clues;
  final List<int> points;
  final SpyStep step;
  final int index;
  final bool flipped;
  final int round;
  final List<int> votes;
  final int? selected;
  final int? guess;
  final bool finished;
  final ToastMessage? toast;

  SpyGameState copyWith({
    List<List<String>>? clues,
    List<int>? points,
    SpyStep? step,
    int? index,
    bool? flipped,
    int? round,
    List<int>? votes,
    int? selected,
    bool clearSelected = false,
    int? guess,
    bool? finished,
    ToastMessage? toast,
  }) => SpyGameState(
    clues: clues ?? this.clues,
    points: points ?? this.points,
    step: step ?? this.step,
    index: index ?? this.index,
    flipped: flipped ?? this.flipped,
    round: round ?? this.round,
    votes: votes ?? this.votes,
    selected: clearSelected ? null : selected ?? this.selected,
    guess: guess ?? this.guess,
    finished: finished ?? this.finished,
    toast: toast,
  );
}
