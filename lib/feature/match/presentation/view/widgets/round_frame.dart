import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/match_app/match_hud.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/match/presentation/view_model/match_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundFrame extends StatelessWidget {
  const RoundFrame({super.key, required this.child, this.turn});

  final Widget child;
  final MatchSide? turn;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        final cubit = context.read<MatchCubit>();
        final me = context.tr(AppStrings.mockPlayerAhmed);
        final opp = context.tr(cubit.oppNameKey);
        final delta = state.delta;
        final active = turn;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          foregroundDecoration: BoxDecoration(
            border: Border.all(
              color: active == null ? Colors.transparent : active.fill,
              width: 2,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                MatchHud(
                  meName: me,
                  meInitial: me.characters.first,
                  meScore: state.meScore,
                  oppName: opp,
                  oppInitial: cubit.initialOf(opp),
                  oppScore: state.oppScore,
                  modeName: context.tr(state.mode.nameKey),
                  modeInk: state.mode.ink,
                  dots: [
                    for (var i = 0; i < state.modes.length; i++)
                      (
                        color: i <= state.roundIndex
                            ? state.modes[i].accent
                            : AppColors.s3,
                        active: i == state.roundIndex,
                      ),
                  ],
                  meTurnLabel: context.tr(AppStrings.yourTurn),
                  oppTurnLabel: context.tr(AppStrings.hisTurn),
                  meTurn: turn == MatchSide.me,
                  oppTurn: turn == MatchSide.opp,
                  meDelta: delta?.side == MatchSide.me
                      ? '+${delta!.amount}'
                      : null,
                  oppDelta: delta?.side == MatchSide.opp
                      ? '+${delta!.amount}'
                      : null,
                ),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}
