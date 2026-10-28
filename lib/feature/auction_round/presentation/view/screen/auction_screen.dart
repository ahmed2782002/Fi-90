import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_lot_section.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_match_view.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_pitches.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_reveal_layer.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_setup.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_top_bar.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_cubit.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view/widgets/round_frame.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchCubit>();
    return BlocProvider(
      create: (_) => AuctionCubit(skill: match.skill),
      child: BlocConsumer<AuctionCubit, AuctionState>(
        listener: (context, state) {
          final toast = state.toast, score = state.score, done = state.finished;
          if (toast != null) AppToast.show(context, toast);
          if (score != null) match.addScore(score.side, score.points);
          if (done != null) {
            match.finishQuestion(
              done.winner,
              25,
              AppStrings.auctionDetail,
              args: [done.detail],
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuctionCubit>();
          final opponent = context.tr(match.oppNameKey);
          final sim = state.sim;
          return RoundFrame(
            turn: cubit.turn,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0, .32),
                      radius: .8,
                      colors: [
                        AppColors.tint(AppColors.gold, .12),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
                    children: [
                      AuctionTopBar(
                        meLabel: context.tr(AppStrings.you),
                        meBudget: state.budget[MatchSide.me]!,
                        oppLabel: opponent,
                        oppBudget: state.budget[MatchSide.opp]!,
                        stage: switch (state.phase) {
                          AuctionPhase.setup => context.tr(
                            AppStrings.pickAuction,
                          ),
                          AuctionPhase.match || AuctionPhase.fullTime =>
                            context.tr(AppStrings.theMatch),
                          _ => context.tr(
                            AppStrings.auctionStage,
                            args: [
                              '${state.pair + 1}',
                              '${cubit.pairs.length}',
                              context.tr(cubit.pair.slotKey),
                            ],
                          ),
                        },
                      ),
                      const SizedBox(height: 12),
                      if (state.phase == AuctionPhase.setup)
                        AuctionSetup(onPick: cubit.pickSize)
                      else if (sim != null && cubit.inMatch)
                        AuctionMatchView(
                          sim: sim,
                          events: cubit.shownEvents,
                          minute: state.minute,
                          done: state.phase == AuctionPhase.fullTime,
                          goalsMe: cubit.goals(MatchSide.me),
                          goalsOpp: cubit.goals(MatchSide.opp),
                          meAverage: cubit.average(MatchSide.me),
                          oppAverage: cubit.average(MatchSide.opp),
                          opponent: opponent,
                          onSkip: cubit.skip,
                        )
                      else
                        const AuctionLotSection(),
                      if (state.phase != AuctionPhase.setup) ...[
                        const SizedBox(height: 12),
                        const AuctionPitches(),
                      ],
                    ],
                  ),
                ),
                const Positioned.fill(child: AuctionRevealLayer()),
              ],
            ),
          );
        },
      ),
    );
  }
}
