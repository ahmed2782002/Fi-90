import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_text_field.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/complaint/mock_model/complaint_type.dart';
import 'package:fii90/core/widgets/select_chip.dart';
import 'package:fii90/feature/complaint/presentation/view_model/complaint_cubit.dart';
import 'package:fii90/feature/complaint/presentation/view_model/complaint_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintCubit(),
      child: BlocConsumer<ComplaintCubit, ComplaintState>(
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (state.sent) Navigator.of(context).pop();
        },
        builder: (context, state) {
          final cubit = context.read<ComplaintCubit>();
          return SubPage(
            title: context.tr(AppStrings.complaints),
            bottom: PrimaryButton(
              label: context.tr(AppStrings.send),
              height: 56,
              style: AppText.actionButton(16),
              onTap: cubit.send,
            ),
            children: [
              Text(
                context.tr(AppStrings.complaintIntro),
                style: AppText.pageIntro,
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < ComplaintType.mock.length; i++)
                    SelectChip(
                      label: context.tr(ComplaintType.mock[i]),
                      selected: state.type == i,
                      onTap: () => cubit.selectType(i),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(AppStrings.details),
                    style: AppText.fieldLabel,
                  ),
                  const SizedBox(height: 6),
                  AppTextField(
                    controller: cubit.detailsController,
                    hint: context.tr(AppStrings.detailsHint),
                    multiline: true,
                  ),
                ],
              ),
              Text(context.tr(AppStrings.autoInfo), style: AppText.note),
            ],
          );
        },
      ),
    );
  }
}
