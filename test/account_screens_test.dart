import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/layout/presentation/view/screen/layout_screen.dart';
import 'package:fii90/feature/sound/presentation/view/screen/sound_screen.dart';
import 'package:fii90/core/widgets/settings_app/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/localized_app.dart';

Future<void> scrollTo(WidgetTester tester, String text) async {
  await tester.dragUntilVisible(
    find.text(text),
    find.byType(ListView).hitTestable().first,
    const Offset(0, -250),
  );
  await tester.ensureVisible(find.text(text));
  await tester.pump();
}

void main() {
  testWidgets('account sub-screens open and light mode switches live', (
    tester,
  ) async {
    await pumpLocalized(tester, const LayoutScreen());
    await tester.tap(find.text('حسابي'));
    await tester.pump();

    await tester.tap(find.text('الصوت'));
    await settleAsync(tester);
    expect(find.byType(SoundScreen), findsOneWidget);
    await tester.tap(find.byType(ToggleSwitch).first);
    await tester.pump();
    expect(find.text('مقفولة مع كل الأصوات'), findsNWidgets(2));
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.bySemanticsLabel('رجوع'));
    await settleAsync(tester);
    expect(find.text('كل الأصوات مقفولة'), findsOneWidget);

    await scrollTo(tester, 'الباقات والاشتراك');
    await tester.tap(find.text('الباقات والاشتراك'));
    await settleAsync(tester);
    expect(find.text('رصيدك'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('رجوع'));
    await settleAsync(tester);

    await scrollTo(tester, 'فاتح');
    expect(AppColors.isDark, isTrue);
    await tester.tap(find.text('فاتح'));
    await settleAsync(tester);
    expect(AppColors.isDark, isFalse);
    await tester.tap(find.text('داكن'));
    await settleAsync(tester);
    expect(AppColors.isDark, isTrue);

    await scrollTo(tester, 'تسجيل الخروج');
    await tester.tap(find.text('تسجيل الخروج'));
    await settleAsync(tester);
    expect(find.text('تسجيل الخروج؟'), findsOneWidget);
    await tester.tap(find.text('إلغاء'));
    await settleAsync(tester);
    expect(find.text('تسجيل الخروج؟'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
}
