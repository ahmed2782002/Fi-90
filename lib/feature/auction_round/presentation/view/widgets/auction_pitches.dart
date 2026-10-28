import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/team_pitch.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_cubit.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionPitches extends StatelessWidget {
  const AuctionPitches({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuctionCubit>();
    final state = cubit.state;
    final opponent = context.tr(context.read<MatchCubit>().oppNameKey);
    final fresh = state.revealing ? cubit.pair.slot : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(6, 4, 6, 0),
          child: Text(
            context.tr(AppStrings.bothLineups),
            style: AppText.listHeader,
          ),
        ),
        for (final side in MatchSide.values)
          TeamPitch(
            name: side == MatchSide.me
                ? context.tr(AppStrings.yourTeam)
                : opponent,
            nameColor: side.ink,
            active: state.phase == AuctionPhase.bid && state.turn == side,
            subtitle: cubit.playerCount(side) == 0
                ? context.tr(AppStrings.noPlayersYet)
                : context.tr(
                    AppStrings.playersCount,
                    args: [
                      '${cubit.playerCount(side)}',
                      '${cubit.pairs.length - 1}',
                      '${cubit.average(side)}',
                    ],
                  ),
            team: state.teams[side]!,
            rows: cubit.rows,
            glow: side.fill,
            freshSlot: fresh,
          ),
      ],
    );
  }
}
