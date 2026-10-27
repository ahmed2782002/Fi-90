import 'package:flutter_test/flutter_test.dart';

import 'package:fii90/feature/splash/presentation/view/screen/splash_screen.dart';
import 'package:fii90/main.dart';

void main() {
  testWidgets('app boots into the splash screen', (tester) async {
    await tester.pumpWidget(const Fii90App());
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
