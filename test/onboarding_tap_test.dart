import 'package:fii90/feature/onboarding/presentation/view/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/localized_app.dart';

void main() {
  testWidgets('next advances the slide', (tester) async {
    await pumpLocalized(tester, const OnboardingScreen());
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.text('التالي'));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('4 تحديات في ماتش واحد'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
