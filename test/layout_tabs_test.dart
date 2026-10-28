import 'package:fii90/feature/layout/presentation/view/screen/layout_screen.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/play_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/localized_app.dart';

void main() {
  testWidgets(
    'tabs switch, the 90 button opens the sheet, language switches live',
    (tester) async {
      await pumpLocalized(tester, const LayoutScreen());
      expect(find.text('جاهز للمواجهة؟'), findsOneWidget);

      await tester.tap(find.text('الصحاب'));
      await tester.pump();
      expect(find.text('ألعاب الصحاب'), findsOneWidget);

      await tester.tap(find.text('مشواري').last);
      await tester.pump();
      expect(find.text('الترتيب'), findsOneWidget);

      await tester.tap(find.text('حسابي'));
      await tester.pump();
      expect(find.text('الأداء في كل تحدي'), findsOneWidget);

      await tester.tap(find.bySemanticsLabel('ابدأ مباراة'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(PlaySheet), findsOneWidget);
      expect(find.text('مين هتلاعب؟'), findsOneWidget);
      await tester.tap(find.text('✕'));
      await settleAsync(tester);
      expect(find.byType(PlaySheet), findsNothing);

      await tester.dragUntilVisible(
        find.text('English'),
        find.byType(ListView).hitTestable().first,
        const Offset(0, -300),
      );
      await tester.ensureVisible(find.text('English'));
      await tester.pump();
      await tester.tap(find.text('English'));
      await settleAsync(tester);
      expect(find.text('Account'), findsWidgets);
      expect(find.text('Preferences'), findsOneWidget);
      expect(find.text('Journey'), findsOneWidget);
      expect(find.text('Language: English'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpWidget(const SizedBox());
    },
  );
}
