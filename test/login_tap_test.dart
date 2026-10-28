import 'package:fii90/feature/auth/presentation/view/screen/login_screen.dart';
import 'package:fii90/feature/home/presentation/view/screen/home_screen.dart';
import 'package:fii90/feature/layout/presentation/view/screen/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/localized_app.dart';

void main() {
  testWidgets('google button opens the layout on the home tab', (tester) async {
    final original = FlutterError.onError;
    FlutterError.onError = (d) {
      if (!d.toString().contains('overflowed')) original?.call(d);
    };
    addTearDown(() => FlutterError.onError = original);
    await pumpLocalized(tester, const LoginScreen());
    await tester.tap(find.text('المتابعة بـ Google'));
    await settleAsync(tester);
    expect(find.byType(LayoutScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
