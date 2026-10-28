import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class LocalizedText {
  const LocalizedText(this.ar, this.en);

  final String ar;
  final String en;

  String of(BuildContext context) =>
      context.locale.languageCode == 'ar' ? ar : en;
}
