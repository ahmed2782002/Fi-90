import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameEndCubit extends Cubit<({bool saved, ToastMessage? toast})> {
  GameEndCubit({required this.scores}) : super((saved: false, toast: null));

  final List<int> scores;

  int get winner {
    final best = scores.reduce((a, b) => a > b ? a : b);
    final top = [
      for (final (i, s) in scores.indexed)
        if (s == best) i,
    ];
    return top.length == 1 ? top.first : -1;
  }

  void save() {
    if (state.saved) return;
    emit((saved: true, toast: const ToastMessage(AppStrings.savedToJourney)));
  }
}
