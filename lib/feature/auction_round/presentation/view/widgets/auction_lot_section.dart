import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/bid_panel.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/lot_card.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_cubit.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionLotSection extends StatelessWidget {
  const AuctionLotSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuctionCubit>();
    final state = cubit.state;
    final opponent = context.tr(context.read<MatchCubit>().oppNameKey);
    final holder = state.holder;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        LotCard(
          position: state.clues >= 1 ? cubit.hidden.position : '?',
          statLabels: cubit.hidden.statLabels,
          clues: [for (final c in cubit.pair.clues) c.of(context)],
          revealed: state.clues,
          pendingLabel: context.tr(AppStrings.clueRevealing),
        ),
        BidPanel(
          price: state.price,
          opened: holder != null,
          holder: holder == null
              ? context.tr(AppStrings.noBidYet)
              : holder == MatchSide.me
              ? context.tr(AppStrings.you)
              : opponent,
          holderColor: holder?.ink ?? AppColors.mu,
          progress: cubit.timerProgress,
          urgent: cubit.urgent,
          mode: cubit.bidMode,
          canRaise: cubit.canRaise,
          hint: cubit.canRaise
              ? context.tr(
                  AppStrings.bidHint,
                  args: ['${state.price + 1}', opponent, '${state.price}'],
                )
              : context.tr(AppStrings.budgetOver),
          opponent: opponent,
          onRaise: cubit.raise,
          onPass: cubit.pass,
        ),
      ],
    );
  }
}
