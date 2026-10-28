import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/complaint/presentation/view_model/complaint_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit() : super(const ComplaintState());

  final detailsController = TextEditingController();

  void selectType(int index) => emit(ComplaintState(type: index));

  void send() => emit(
    detailsController.text.trim().length < 10
        ? ComplaintState(
            type: state.type,
            toast: const ToastMessage(
              AppStrings.moreDetailsToast,
              kind: ToastKind.warn,
            ),
          )
        : ComplaintState(
            type: state.type,
            sent: true,
            toast: const ToastMessage(AppStrings.complaintSentToast),
          ),
  );

  @override
  Future<void> close() {
    detailsController.dispose();
    return super.close();
  }
}
