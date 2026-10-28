import 'dart:math';

import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/act_game/mock_model/act_card.dart';
import 'package:fii90/feature/spy_game/presentation/view_model/spy_game_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpyGameCubit extends Cubit<SpyGameState> {
  SpyGameCubit({required this.players, Random? random})
    : _random = random ?? Random(),
      super(
        SpyGameState(
          clues: [for (final _ in players) const []],
          points: [for (final _ in players) 0],
        ),
      ) {
    secret = ActCard.mock[_random.nextInt(ActCard.mock.length)];
    spy = _random.nextInt(players.length);
    options = [
      secret,
      ...([...ActCard.mock]
            ..remove(secret)
            ..shuffle(_random))
          .take(3),
    ]..shuffle(_random);
  }

  final List<String> players;
  final Random _random;
  final draft = TextEditingController();
  late final ActCard secret;
  late final int spy;
  late final List<ActCard> options;

  bool get isSpyTurn => state.index == spy;

  bool get isLast => state.index >= players.length - 1;

  List<int> get tally => [
    for (var j = 0; j < players.length; j++)
      state.votes.where((v) => v == j).length,
  ];

  bool get caught {
    final counts = tally;
    final top = counts.reduce(max);
    return counts[spy] == top && counts.where((c) => c == top).length == 1;
  }

  List<({int player, List<String> words})> get words => [
    for (final (i, c) in state.clues.indexed)
      if (c.isNotEmpty) (player: i, words: c),
  ];

  List<int> get suspects => [
    for (var j = 0; j < players.length; j++)
      if (j != state.index) j,
  ];

  void ready() => emit(state.copyWith(step: SpyStep.flip, flipped: false));

  void flip() {
    if (!state.flipped) emit(state.copyWith(flipped: true));
  }

  void passOn() => emit(
    isLast
        ? state.copyWith(step: SpyStep.clue, index: 0, flipped: false)
        : state.copyWith(
            step: SpyStep.pass,
            index: state.index + 1,
            flipped: false,
          ),
  );

  void say() {
    final word = draft.text.trim();
    final error = word.isEmpty
        ? AppStrings.typeWordFirst
        : word.split(RegExp(r'\s+')).length > 2
        ? AppStrings.oneWordOnly
        : null;
    if (error != null) {
      return emit(
        state.copyWith(toast: ToastMessage(error, kind: ToastKind.warn)),
      );
    }
    draft.clear();
    final clues = [
      for (final c in state.clues) [...c],
    ]..[state.index].add(word);
    final wrapped = isLast;
    emit(
      state.copyWith(
        clues: clues,
        index: wrapped ? 0 : state.index + 1,
        step: wrapped && state.round >= 2 ? SpyStep.decide : SpyStep.clue,
        round: wrapped && state.round < 2 ? state.round + 1 : state.round,
      ),
    );
  }

  void anotherRound() => emit(
    state.copyWith(step: SpyStep.clue, index: 0, round: state.round + 1),
  );

  void startVote() => emit(
    state.copyWith(
      step: SpyStep.vote,
      index: 0,
      votes: const [],
      clearSelected: true,
    ),
  );

  void select(int player) => emit(state.copyWith(selected: player));

  void vote() {
    final choice = state.selected;
    if (choice == null) return;
    final votes = [...state.votes, choice];
    if (votes.length < players.length) {
      return emit(
        state.copyWith(votes: votes, index: votes.length, clearSelected: true),
      );
    }
    final points = [...state.points];
    for (final (i, v) in votes.indexed) {
      if (v == spy && i != spy) points[i] += 10;
    }
    emit(
      state.copyWith(
        votes: votes,
        points: points,
        step: SpyStep.reveal,
        clearSelected: true,
      ),
    );
  }

  void guessPlayer(int option) {
    if (state.guess != null) return;
    final points = [...state.points];
    if (options[option] == secret) points[spy] += 10;
    emit(state.copyWith(guess: option, points: points));
  }

  void finish() => emit(state.copyWith(finished: true));

  @override
  Future<void> close() {
    draft.dispose();
    return super.close();
  }
}
