import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/plans/mock_model/plan.dart';
import 'package:fii90/feature/plans/presentation/view/widgets/balance_card.dart';
import 'package:fii90/feature/plans/presentation/view/widgets/cycle_switch.dart';
import 'package:fii90/feature/plans/presentation/view/widgets/plan_card.dart';
import 'package:fii90/feature/plans/presentation/view/widgets/plan_details.dart';
import 'package:fii90/feature/plans/presentation/view_model/plans_cubit.dart';
import 'package:fii90/feature/plans/presentation/view_model/plans_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlansCubit, PlansState>(
      builder: (context, state) {
        final cubit = context.read<PlansCubit>();
        return SubPage(
          title: context.tr(AppStrings.plans),
          gap: 16,
          children: [
            const BalanceCard(coins: Plan.coinsBalance),
            CycleSwitch(index: cubit.cycleIndex, onSelect: cubit.selectCycle),
            for (final plan in cubit.plans)
              PlanCard(
                details: PlanDetails(
                  name: context.tr(plan.tier.nameKey),
                  nameColor: plan.tier.titleColor,
                  tag: context.tr(plan.tagKey),
                  price: cubit.price(plan) == null
                      ? '0'
                      : context.tr(
                          AppStrings.priceEgp,
                          args: ['${cubit.price(plan)}'],
                        ),
                  per: context.tr(cubit.perKey(plan)),
                  features: [for (final f in plan.features) context.tr(f)],
                ),
                button: context.tr(
                  cubit.buttonKey(plan),
                  args: [context.tr(plan.tier.nameKey)],
                ),
                popular: plan.popular,
                current: cubit.isCurrent(plan),
                main: cubit.isMain(plan),
                popularLabel: context.tr(AppStrings.mostPopular),
                onTap: () => cubit.choose(plan),
              ),
            Text(
              context.tr(AppStrings.renewNote),
              textAlign: TextAlign.center,
              style: AppText.renewNote,
            ),
          ],
        );
      },
    );
  }
}
