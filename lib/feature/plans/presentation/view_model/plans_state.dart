import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/plans/mock_model/plan.dart';

class PlansState {
  const PlansState({
    this.current = PlanTier.free,
    this.yearly = true,
    this.toast,
  });

  final PlanTier current;
  final bool yearly;
  final ToastMessage? toast;
}
