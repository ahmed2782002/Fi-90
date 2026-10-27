import 'package:fii90/feature/auth/presentation/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('google button shows the not-connected message', (tester) async {
    final original = FlutterError.onError;
    FlutterError.onError = (d) {
      if (!d.toString().contains('overflowed')) original?.call(d);
    };
    addTearDown(() => FlutterError.onError = original);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('المتابعة بـ Google'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('تسجيل الدخول بـ Google لسه مش متوصل'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
