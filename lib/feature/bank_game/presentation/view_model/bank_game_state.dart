import 'package:fii90/core/widgets/app_toast/toast_message.dart';

enum BankStep { ask, reveal, switchTeam }

class BankGameState {
  const BankGameState({
    this.team = 0,
    this.question = 0,
    this.pot = 0,
    this.chain = 0,
    this.banked = const [0, 0],
    this.step = BankStep.ask,
    this.lost = 0,
    this.finished = false,
    this.toast,
  });

  final int team;
  final int question;
  final int pot;
  final int chain;
  final List<int> banked;
  final BankStep step;
  final int lost;
  final bool finished;
  final ToastMessage? toast;

  BankGameState copyWith({
    int? team,
    int? question,
    int? pot,
    int? chain,
    List<int>? banked,
    BankStep? step,
    int? lost,
    bool? finished,
    ToastMessage? toast,
  }) => BankGameState(
    team: team ?? this.team,
    question: question ?? this.question,
    pot: pot ?? this.pot,
    chain: chain ?? this.chain,
    banked: banked ?? this.banked,
    step: step ?? this.step,
    lost: lost ?? this.lost,
    finished: finished ?? this.finished,
    toast: toast,
  );
}
