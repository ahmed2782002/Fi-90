import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/full_time_card.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/match_event_row.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/power_bars.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/sim_scoreboard.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:flutter/material.dart';

class AuctionMatchView extends StatelessWidget {
  const AuctionMatchView({
    super.key,
    required this.sim,
    required this.events,
    required this.minute,
    required this.done,
    required this.goalsMe,
    required this.goalsOpp,
    required this.meAverage,
    required this.oppAverage,
    required this.opponent,
    required this.onSkip,
  });

  final SimResult sim;
  final List<MatchEvent> events;
  final int minute;
  final bool done;
  final int goalsMe;
  final int goalsOpp;
  final int meAverage;
  final int oppAverage;
  final String opponent;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final pens = sim.penalties;
    final team = context.tr(AppStrings.yourTeam);
    String nameOf(MatchSide side) => side == MatchSide.me ? team : opponent;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        SimScoreboard(
          minuteLabel: done ? context.tr(AppStrings.fullTime) : "$minute'",
          progress: minute / 90,
          goalsMe: done ? sim.goalsMe : goalsMe,
          goalsOpp: done ? sim.goalsOpp : goalsOpp,
          meAverage: meAverage,
          oppAverage: oppAverage,
          opponent: opponent,
          penalties: done && pens != null ? '${pens.me} – ${pens.opp}' : null,
        ),
        PowerBars(
          title: context.tr(AppStrings.teamsPower),
          rows: [
            (
              label: context.tr(AppStrings.attack),
              me: sim.me.att,
              opp: sim.opp.att,
            ),
            (
              label: context.tr(AppStrings.defence),
              me: sim.me.def,
              opp: sim.opp.def,
            ),
          ],
        ),
        if (events.isEmpty && !done)
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.line),
            ),
            child: Text(
              context.tr(AppStrings.matchStarted),
              textAlign: TextAlign.center,
              style: AppText.caption,
            ),
          ),
        for (final e in events.reversed)
          MatchEventRow(
            key: ValueKey('${e.minute}-${e.side.name}'),
            minute: e.minute,
            color: e.side.fill,
            goal: e.goal,
            text: e.goal
                ? context.tr(
                    AppStrings.scoresFor,
                    args: [e.who.of(context), nameOf(e.side)],
                  )
                : context.tr(
                    AppStrings.savesShot,
                    args: [e.who.of(context), e.against?.of(context) ?? ''],
                  ),
          ),
        if (!done)
          SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: onSkip,
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.s1,
                side: BorderSide(color: AppColors.line2),
                shape: const StadiumBorder(),
              ),
              child: Text(
                context.tr(AppStrings.skipToResult),
                style: AppText.ghostButton,
              ),
            ),
          ),
        if (done)
          FullTimeCard(
            winner: nameOf(sim.winner),
            color: sim.winner.ink,
            points: 25,
            penalties: pens != null,
          ),
      ],
    );
  }
}
