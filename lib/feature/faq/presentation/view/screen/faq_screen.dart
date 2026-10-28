import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/faq/mock_model/faq_item.dart';
import 'package:fii90/feature/complaint/presentation/view/screen/complaint_screen.dart';
import 'package:fii90/feature/faq/presentation/view/widgets/contact_card.dart';
import 'package:fii90/feature/faq/presentation/view/widgets/faq_tile.dart';
import 'package:fii90/core/widgets/select_chip.dart';
import 'package:fii90/feature/faq/presentation/view_model/faq_cubit.dart';
import 'package:fii90/feature/faq/presentation/view_model/faq_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FaqCubit(),
      child: BlocBuilder<FaqCubit, FaqState>(
        builder: (context, state) {
          final cubit = context.read<FaqCubit>();
          return SubPage(
            title: context.tr(AppStrings.faq),
            gap: 16,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i < FaqItem.categories.length; i++) ...[
                      if (i > 0) const SizedBox(width: 8),
                      SelectChip(
                        label: context.tr(FaqItem.categories[i]),
                        selected: state.category == i,
                        gradient: true,
                        height: 38,
                        onTap: () => cubit.selectCategory(i),
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                children: [
                  for (final item in cubit.items) ...[
                    if (item != cubit.items.first) const SizedBox(height: 10),
                    FaqTile(
                      question: context.tr(item.questionKey),
                      answer: context.tr(item.answerKey),
                      open: cubit.isOpen(item),
                      onTap: () => cubit.toggle(item),
                    ),
                  ],
                ],
              ),
              ContactCard(
                onContact: () => Nav.replace(context, const ComplaintScreen()),
              ),
            ],
          );
        },
      ),
    );
  }
}
