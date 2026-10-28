import 'package:fii90/core/widgets/app_toast/toast_message.dart';

typedef PhotoFeedback = ({
  bool ok,
  String? playerKey,
  String who,
  int strikes,
  bool skipped,
});

class PhotoGameState {
  const PhotoGameState({
    this.found = const {},
    this.strikes = const [0, 0],
    this.answered = const [0, 0],
    this.turn = 0,
    this.feedback,
    this.finished = false,
    this.toast,
    this.duplicate,
  });

  final Map<String, int> found;
  final List<int> strikes;
  final List<int> answered;
  final int turn;
  final PhotoFeedback? feedback;
  final bool finished;
  final ToastMessage? toast;
  final String? duplicate;

  PhotoGameState copyWith({
    Map<String, int>? found,
    List<int>? strikes,
    List<int>? answered,
    int? turn,
    PhotoFeedback? feedback,
    bool? finished,
    ToastMessage? toast,
    String? duplicate,
  }) => PhotoGameState(
    found: found ?? this.found,
    strikes: strikes ?? this.strikes,
    answered: answered ?? this.answered,
    turn: turn ?? this.turn,
    feedback: feedback ?? this.feedback,
    finished: finished ?? this.finished,
    toast: toast,
    duplicate: duplicate,
  );
}
