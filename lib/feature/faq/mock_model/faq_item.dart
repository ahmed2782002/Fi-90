import 'package:fii90/core/localization/app_strings.dart';

class FaqItem {
  const FaqItem(this.category, this.questionKey, this.answerKey);

  final int category;
  final String questionKey;
  final String answerKey;

  static const categories = [
    AppStrings.faqCatPlay,
    AppStrings.faqCatPoints,
    AppStrings.faqCatAccount,
    AppStrings.faqCatProblems,
  ];

  static const mock = [
    FaqItem(0, AppStrings.faqQ1, AppStrings.faqA1),
    FaqItem(0, AppStrings.faqQ2, AppStrings.faqA2),
    FaqItem(0, AppStrings.faqQ3, AppStrings.faqA3),
    FaqItem(0, AppStrings.faqQ4, AppStrings.faqA4),
    FaqItem(1, AppStrings.faqQ5, AppStrings.faqA5),
    FaqItem(1, AppStrings.faqQ6, AppStrings.faqA6),
    FaqItem(2, AppStrings.faqQ7, AppStrings.faqA7),
    FaqItem(2, AppStrings.faqQ8, AppStrings.faqA8),
    FaqItem(3, AppStrings.faqQ9, AppStrings.faqA9),
    FaqItem(3, AppStrings.faqQ10, AppStrings.faqA10),
  ];
}
