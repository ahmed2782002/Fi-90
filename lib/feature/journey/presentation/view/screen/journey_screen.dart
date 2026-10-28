import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/pill_segment.dart';
import 'package:fii90/feature/journey/mock_model/leader.dart';
import 'package:fii90/feature/journey/mock_model/match_record.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/board_chip.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/history_card.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/ranking_list.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/my_rank_bar.dart';
import 'package:fii90/feature/journey/presentation/view_model/journey_cubit.dart';
import 'package:fii90/feature/journey/presentation/view_model/journey_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JourneyCubit, JourneyState>(
      builder: (context, state) {
        final cubit = context.read<JourneyCubit>();
        return SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        context.tr(AppStrings.navJourney),
                        style: AppText.screenTitle,
                      ),
                      const SizedBox(height: 12),
                      PillSegment(
                        labels: [
                          context.tr(AppStrings.journeyRanking),
                          context.tr(AppStrings.matchHistory),
                        ],
                        index: state.segment.index,
                        onSelect: cubit.selectSegment,
                        style: AppText.segment,
                        activeGradient: AppColors.grad,
                        activeShadow: AppShadows.segment,
                        height: 40,
                        padding: 4,
                        expand: true,
                      ),
                      if (cubit.isRanking) ...[
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (
                                var i = 0;
                                i < Leader.boards.length;
                                i++
                              ) ...[
                                if (i > 0) const SizedBox(width: 6),
                                BoardChip(
                                  label: context.tr(Leader.boards[i]),
                                  selected: state.board == i,
                                  onTap: () => cubit.selectBoard(i),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Expanded(
                  child: cubit.isRanking
                      ? RankingList(leaders: cubit.leaders)
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
                          itemCount: MatchRecord.mock.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 10),
                          itemBuilder: (_, i) =>
                              HistoryCard(record: MatchRecord.mock[i]),
                        ),
                ),
                if (cubit.isRanking)
                  MyRankBar(
                    rank: cubit.myRank,
                    name: context.tr(AppStrings.you),
                    initial: context
                        .tr(AppStrings.mockPlayerAhmed)
                        .characters
                        .first,
                    board: context.tr(cubit.boardKey),
                    score: Leader.myScore,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
