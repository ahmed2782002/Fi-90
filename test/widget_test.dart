import 'package:fii90/feature/splash/presentation/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/localized_app.dart';

void main() {
  testWidgets('app boots into the splash screen', (tester) async {
    await pumpLocalized(tester, const SplashScreen());
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
