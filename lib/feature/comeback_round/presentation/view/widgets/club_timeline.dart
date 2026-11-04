import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/comeback_round/mock_model/comeback_question.dart';
import 'package:fii90/feature/comeback_round/presentation/view/widgets/club_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          start: 10.w,
          top: 18.r,
          bottom: 18.r,
          child: Container(
            width: 2.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
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
          padding: EdgeInsetsDirectional.only(start: 28.w),
          child: Column(
            children: [
              for (var i = 0; i < question.clubs.length; i++) ...[
                if (i > 0) SizedBox(height: 6.h),
                Expanded(
                  child: ClubSlot(
                    number: i + 1,
                    shown: i < revealed,
                    current: i == revealed - 1 && !done,
                    name: question.clubs[i].name.of(context),
                    year: question.clubs[i].year,
                    logo: question.clubs[i].logo,
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
