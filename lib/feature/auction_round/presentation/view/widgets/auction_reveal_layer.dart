import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/reveal_overlay.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_cubit.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionRevealLayer extends StatelessWidget {
  const AuctionRevealLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuctionCubit>();
    final state = cubit.state;
    final last = state.last;
    if (!state.revealing || last == null) return const SizedBox.shrink();
    final opponent = context.tr(context.read<MatchCubit>().oppNameKey);
    final free = state.phase == AuctionPhase.revealOther;
    final thing = context.tr(
      cubit.pair.coach ? AppStrings.theCoach : AppStrings.thePlayer,
    );
    final paid = cubit.hidden, other = AuctionPlayer.all[cubit.pair.b]!;
    final comparison = cubit.freeComparison;
    final versus = comparison > 0
        ? [
            other.short.of(context),
            '${other.rating}',
            paid.short.of(context),
            '${paid.rating}',
          ]
        : [
            paid.short.of(context),
            '${paid.rating}',
            other.short.of(context),
            '${other.rating}',
          ];
    return RevealOverlay(
      tag: free
          ? context.tr(AppStrings.free)
          : context.tr(AppStrings.auctionTag, args: ['${last.price}']),
      free: free,
      message: free
          ? context.tr(
              AppStrings.revealFree,
              args: [
                last.other == MatchSide.me
                    ? context.tr(AppStrings.you)
                    : opponent,
                thing,
              ],
            )
          : context.tr(
              last.other == MatchSide.me
                  ? AppStrings.revealYouPassed
                  : AppStrings.revealOppPassed,
              args: [opponent, '${last.price}'],
            ),
      player: cubit.revealed,
      name: cubit.revealed.name.of(context),
      flip: state.flip,
      compare: !free
          ? null
          : comparison == 0
          ? context.tr(AppStrings.sameRating)
          : context.tr(
              comparison > 0
                  ? AppStrings.freeWasBetter
                  : AppStrings.auctionWorthIt,
              args: versus,
            ),
      compareGood: comparison > 0,
    );
  }
}
