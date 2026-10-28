import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/plans/mock_model/plan.dart';
import 'package:fii90/feature/plans/presentation/view_model/plans_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(const PlansState());

  final plans = Plan.mock;

  int get cycleIndex => state.yearly ? 1 : 0;

  bool isCurrent(Plan plan) => plan.tier == state.current;

  bool isMain(Plan plan) => plan.popular && !isCurrent(plan);

  int? price(Plan plan) => state.yearly ? plan.yearly : plan.monthly;

  String perKey(Plan plan) => plan.isFree
      ? AppStrings.forever
      : state.yearly
      ? AppStrings.perYear
      : AppStrings.perMonth;

  String buttonKey(Plan plan) => isCurrent(plan)
      ? AppStrings.currentPlan
      : plan.isFree
      ? AppStrings.backToFree
      : AppStrings.subscribeTo;

  void selectCycle(int index) =>
      emit(PlansState(current: state.current, yearly: index == 1));

  void choose(Plan plan) {
    if (isCurrent(plan)) return;
    emit(
      PlansState(
        current: plan.tier,
        yearly: state.yearly,
        toast: plan.isFree
            ? const ToastMessage(AppStrings.backToFreeToast)
            : ToastMessage(
                AppStrings.subscribedToast,
                args: [plan.tier.nameKey],
                translateArgs: true,
              ),
      ),
    );
  }
}
