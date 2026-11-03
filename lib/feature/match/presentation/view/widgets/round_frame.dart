import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/match_app/match_hud.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view/widgets/mode_rules_sheet.dart';
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
        final glow = active == null ? Colors.transparent : active.fill;
        return Stack(
          children: [
            SafeArea(
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
                    onInfo: () => ModeRulesSheet.show(context, state.mode),
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
            for (final end in [false, true])
              PositionedDirectional(
                top: 0,
                bottom: 0,
                start: end ? null : 0,
                end: end ? 0 : null,
                width: 26,
                child: IgnorePointer(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: end
                            ? AlignmentDirectional.centerEnd
                            : AlignmentDirectional.centerStart,
                        end: end
                            ? AlignmentDirectional.centerStart
                            : AlignmentDirectional.centerEnd,
                        colors: [
                          glow.withValues(alpha: .28),
                          glow.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
