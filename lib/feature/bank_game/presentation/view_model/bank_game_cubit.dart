import 'dart:math';

import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/bank_game/mock_model/bank_question.dart';
import 'package:fii90/feature/bank_game/presentation/view_model/bank_game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankGameCubit extends Cubit<BankGameState> {
  BankGameCubit({required this.names, required this.members})
    : super(const BankGameState());

  static const perTeam = 12;

  final List<String> names;
  final List<List<String>> members;

  BankQuestion get question =>
      BankQuestion.mock[state.team][min(state.question, perTeam - 1)];

  String get player {
    final team = members[state.team];
    return team.isEmpty
        ? names[state.team]
        : team[state.question % team.length];
  }

  bool get canBank => state.step == BankStep.ask && state.pot > 0;

  void bank() {
    if (!canBank) return;
    final banked = [...state.banked]..[state.team] += state.pot;
    emit(
      state.copyWith(
        banked: banked,
        pot: 0,
        chain: 0,
        toast: ToastMessage(AppStrings.bankedToast, args: ['${state.pot}']),
      ),
    );
  }

  void showAnswer() {
    if (state.step == BankStep.ask) emit(state.copyWith(step: BankStep.reveal));
  }

  void judge(bool ok) {
    if (state.step != BankStep.reveal) return;
    final chain = ok ? state.chain + 1 : 0;
    final pot = ok
        ? BankQuestion.ladder[min(chain, BankQuestion.ladder.length) - 1]
        : 0;
    final toast = !ok && state.pot > 0
        ? ToastMessage(
            AppStrings.potLostToast,
            kind: ToastKind.bad,
            args: ['${state.pot}'],
          )
        : null;
    final next = state.question + 1;
    emit(
      next >= perTeam
          ? state.copyWith(
              question: next,
              chain: 0,
              pot: 0,
              lost: pot,
              step: BankStep.switchTeam,
              toast: toast,
            )
          : state.copyWith(
              question: next,
              chain: chain,
              pot: pot,
              step: BankStep.ask,
              toast: toast,
            ),
    );
  }

  void nextTeam() {
    if (state.team == 0) {
      emit(const BankGameState().copyWith(team: 1, banked: state.banked));
    } else {
      emit(state.copyWith(finished: true));
    }
  }
}
