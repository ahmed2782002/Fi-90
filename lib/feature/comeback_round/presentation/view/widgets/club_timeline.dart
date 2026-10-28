import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/comeback_round/mock_model/comeback_question.dart';
import 'package:fii90/feature/comeback_round/presentation/view/widgets/club_slot.dart';
import 'package:flutter/material.dart';

class ClubTimeline extends StatelessWidget {
  const ClubTimeline({
    super.key,
    required this.question,
    required this.revealed,
    required this.done,
  });

  final ComebackQuestion question;
  final int revealed;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
          start: 10,
          top: 18,
          bottom: 18,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.cy, AppColors.tint(AppColors.cy, .1)],
              ),
              boxShadow: [BoxShadow(color: AppColors.cy, blurRadius: 10)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 28),
          child: Column(
            children: [
              for (var i = 0; i < question.clubs.length; i++) ...[
                if (i > 0) const SizedBox(height: 6),
                Expanded(
                  child: ClubSlot(
                    number: i + 1,
                    shown: i < revealed,
                    current: i == revealed - 1 && !done,
                    name: question.clubs[i].name.of(context),
                    year: question.clubs[i].year,
                    abbr: question.clubs[i].abbr,
                    color: question.clubs[i].color,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
