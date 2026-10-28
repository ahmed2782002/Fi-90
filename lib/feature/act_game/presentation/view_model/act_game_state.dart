import 'package:fii90/feature/act_game/mock_model/act_card.dart';

enum ActStep { pick, peek, act }

typedef DeckCard = ({ActCard card, int? result});

typedef ActNotice = ({ActCard card, int team, bool ok, bool timeout});

class ActGameState {
  const ActGameState({
    required this.deck,
    this.turn = 0,
    this.actor = const [0, 0],
    this.step = ActStep.pick,
    this.pick = -1,
    this.shown = false,
    this.seconds = 60,
    this.scores = const [0, 0],
    this.shuffles = 0,
    this.shuffling = false,
    this.finished = false,
    this.notice,
  });

  final List<DeckCard> deck;
  final int turn;
  final List<int> actor;
  final ActStep step;
  final int pick;
  final bool shown;
  final int seconds;
  final List<int> scores;
  final int shuffles;
  final bool shuffling;
  final bool finished;
  final ActNotice? notice;

  ActGameState copyWith({
    List<DeckCard>? deck,
    int? turn,
    List<int>? actor,
    ActStep? step,
    int? pick,
    bool? shown,
    int? seconds,
    List<int>? scores,
    int? shuffles,
    bool? shuffling,
    bool? finished,
    ActNotice? notice,
  }) => ActGameState(
    deck: deck ?? this.deck,
    turn: turn ?? this.turn,
    actor: actor ?? this.actor,
    step: step ?? this.step,
    pick: pick ?? this.pick,
    shown: shown ?? this.shown,
    seconds: seconds ?? this.seconds,
    scores: scores ?? this.scores,
    shuffles: shuffles ?? this.shuffles,
    shuffling: shuffling ?? this.shuffling,
    finished: finished ?? this.finished,
    notice: notice,
  );
}
