import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/feature/journey/mock_model/leader.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/leader_podium.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/rank_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankingList extends StatelessWidget {
  const RankingList({super.key, required this.leaders});

  final List<Leader> leaders;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 12.h),
      children: [
        LeaderPodium(leaders: leaders),
        for (var i = 3; i < leaders.length; i++) ...[
          if (i > 3) SizedBox(height: 6.h),
          RankRow(
            rank: i + 1,
            name: context.tr(leaders[i].nameKey),
            score: leaders[i].score,
          ),
        ],
      ],
    );
  }
}
