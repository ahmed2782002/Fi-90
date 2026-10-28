import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/utils/answer_matcher.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/photo_game/mock_model/lineup_player.dart';
import 'package:fii90/feature/photo_game/presentation/view_model/photo_game_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoGameCubit extends Cubit<PhotoGameState> {
  PhotoGameCubit({required this.names, required this.members})
    : super(const PhotoGameState());

  static const maxStrikes = 4;

  final List<String> names;
  final List<List<String>> members;
  final input = TextEditingController();
  final _scheduler = Scheduler();

  bool isOut(int side) => state.strikes[side] >= maxStrikes;

  int foundBy(int side) => state.found.values.where((v) => v == side).length;

  List<int> get scores => [for (var i = 0; i < names.length; i++) foundBy(i)];

  List<({LineupPlayer player, int? by})> get spots => [
    for (final p in LineupPlayer.mock) (player: p, by: state.found[p.key]),
  ];

  String get turnName {
    final team = members[state.turn];
    return team.length > 1
        ? '${team[state.answered[state.turn] % team.length]} (${names[state.turn]})'
        : names[state.turn];
  }

  String get _who {
    final team = members[state.turn];
    return team.length > 1
        ? team[state.answered[state.turn] % team.length]
        : names[state.turn];
  }

  void submit() {
    if (state.finished) return;
    final typed = AnswerMatcher.normalize(input.text);
    if (typed.length < 2) {
      emit(
        state.copyWith(
          toast: const ToastMessage(
            AppStrings.typeNameFirst,
            kind: ToastKind.warn,
          ),
        ),
      );
      return;
    }
    final hit = LineupPlayer.mock.where(
      (p) => p.aliases.any((a) {
        final alias = AnswerMatcher.normalize(a);
        return alias.length >= 3 && typed.contains(alias);
      }),
    );
    input.clear();
    if (hit.isEmpty) return _miss(skipped: false);
    final player = hit.first;
    if (state.found.containsKey(player.key)) {
      emit(state.copyWith(duplicate: player.key));
      return;
    }
    final feedback = (
      ok: true,
      playerKey: player.key,
      who: _who,
      strikes: state.strikes[state.turn],
      skipped: false,
    );
    _advance(
      state.copyWith(
        found: {...state.found, player.key: state.turn},
        feedback: feedback,
      ),
    );
  }

  void skip() {
    if (!state.finished) _miss(skipped: true);
  }

  void _miss({required bool skipped}) {
    input.clear();
    final strikes = [...state.strikes]..[state.turn] += 1;
    final feedback = (
      ok: false,
      playerKey: null,
      who: skipped ? names[state.turn] : _who,
      strikes: strikes[state.turn],
      skipped: skipped,
    );
    _advance(state.copyWith(strikes: strikes, feedback: feedback));
  }

  void _advance(PhotoGameState next) {
    final answered = [...next.answered]..[next.turn] += 1;
    final alive = [for (final s in next.strikes) s < maxStrikes];
    if (next.found.length >= LineupPlayer.mock.length ||
        !alive.contains(true)) {
      emit(next.copyWith(answered: answered));
      _scheduler.after(1100, () => emit(state.copyWith(finished: true)));
      return;
    }
    var turn = next.turn;
    for (var d = 1; d <= alive.length; d++) {
      final j = (next.turn + d) % alive.length;
      if (alive[j]) {
        turn = j;
        break;
      }
    }
    emit(next.copyWith(answered: answered, turn: turn));
  }

  @override
  Future<void> close() {
    _scheduler.cancel();
    input.dispose();
    return super.close();
  }
}
