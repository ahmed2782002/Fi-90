import 'dart:math';

import 'package:fii90/feature/bank_game/presentation/view_model/bank_game_cubit.dart';
import 'package:fii90/feature/bank_game/presentation/view_model/bank_game_state.dart';
import 'package:fii90/feature/photo_game/presentation/view_model/photo_game_cubit.dart';
import 'package:fii90/feature/private_room/presentation/view_model/private_room_cubit.dart';
import 'package:fii90/feature/spy_game/presentation/view_model/spy_game_cubit.dart';
import 'package:fii90/feature/spy_game/presentation/view_model/spy_game_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bank ladder grows, banks and resets on a miss', () {
    final cubit = BankGameCubit(
      names: ['A', 'B'],
      members: [
        ['a1', 'a2'],
        ['b1', 'b2'],
      ],
    );
    for (final ok in [true, true]) {
      cubit.showAnswer();
      cubit.judge(ok);
    }
    expect(cubit.state.pot, 4);
    cubit.bank();
    expect(cubit.state.banked, [4, 0]);
    cubit.showAnswer();
    cubit.judge(true);
    cubit.showAnswer();
    cubit.judge(false);
    expect(cubit.state.pot, 0);
    expect(cubit.state.banked, [4, 0]);
    cubit.close();
  });

  test('bank switches team after 12 questions', () {
    final cubit = BankGameCubit(
      names: ['A', 'B'],
      members: [
        ['a'],
        ['b'],
      ],
    );
    for (var i = 0; i < BankGameCubit.perTeam; i++) {
      cubit.showAnswer();
      cubit.judge(false);
    }
    expect(cubit.state.step, BankStep.switchTeam);
    cubit.nextTeam();
    expect(cubit.state.team, 1);
    cubit.close();
  });

  test('photo game accepts aliases and counts strikes', () {
    final cubit = PhotoGameCubit(
      names: ['A', 'B'],
      members: [
        ['A'],
        ['B'],
      ],
    );
    cubit.input.text = 'فرانك لامبارد';
    cubit.submit();
    expect(cubit.state.found, {'lampard': 0});
    expect(cubit.state.turn, 1);
    cubit.input.text = 'ميسي';
    cubit.submit();
    expect(cubit.state.strikes, [0, 1]);
    cubit.close();
  });

  test('spy game reaches the vote and rewards catching the spy', () {
    final cubit = SpyGameCubit(players: ['A', 'B', 'C'], random: Random(1));
    for (var i = 0; i < 3; i++) {
      cubit.ready();
      cubit.flip();
      cubit.passOn();
    }
    expect(cubit.state.step, SpyStep.clue);
    for (var i = 0; i < 6; i++) {
      cubit.draft.text = 'word';
      cubit.say();
    }
    expect(cubit.state.step, SpyStep.decide);
    cubit.startVote();
    for (var v = 0; v < 3; v++) {
      final target = cubit.spy == cubit.state.index
          ? cubit.suspects.first
          : cubit.spy;
      cubit.select(target);
      cubit.vote();
    }
    expect(cubit.state.step, SpyStep.reveal);
    expect(cubit.caught, isTrue);
    expect(cubit.state.points.where((p) => p == 10).length, 2);
    cubit.close();
  });

  test('private room joins only with the demo code', () {
    final cubit = PrivateRoomCubit();
    cubit.selectTab(1);
    cubit.input.text = 'abcd';
    cubit.join();
    expect(cubit.state.invalid, isTrue);
    cubit.dismissInvalid();
    cubit.input.text = '7k4q';
    expect(cubit.input.text, '7K4Q');
    cubit.join();
    expect(cubit.state.lobby, isTrue);
    cubit.toggleReady();
    expect(cubit.canStart, isTrue);
    cubit.close();
  });
}
