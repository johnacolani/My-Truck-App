import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  Widget wrap(Widget child, {bool dark = false}) => MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: dark ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(body: child),
      );

  group('AppStatusBanner', () {
    final samples = <AppStatusType, IconData>{
      AppStatusType.success: Icons.check_circle_outline,
      AppStatusType.warning: Icons.warning_amber_rounded,
      AppStatusType.error: Icons.error_outline,
      AppStatusType.info: Icons.info_outline,
    };

    for (final entry in samples.entries) {
      testWidgets('renders ${entry.key.name} with icon and text', (tester) async {
        await tester.pumpWidget(wrap(AppStatusBanner(
          type: entry.key,
          title: 'Example title',
          message: 'Example message',
        )));
        expect(find.text('Example title'), findsOneWidget);
        expect(find.text('Example message'), findsOneWidget);
        expect(find.byIcon(entry.value), findsOneWidget);
      });
    }

    testWidgets('exposes caller-supplied accessibility label', (tester) async {
      final semantics = tester.ensureSemantics();
      await tester.pumpWidget(wrap(const AppStatusBanner(
        type: AppStatusType.success,
        title: 'Saved',
        message: 'The action completed.',
        semanticsLabel: 'Successful action, saved',
      )));
      expect(
        find.bySemanticsLabel('Successful action, saved'),
        findsOneWidget,
      );
      semantics.dispose();
    });

    testWidgets('renders in dark mode', (tester) async {
      await tester.pumpWidget(wrap(
        const AppStatusBanner(
          type: AppStatusType.info,
          title: 'Info',
          message: 'Dark example',
        ),
        dark: true,
      ));
      expect(find.byType(AppStatusBanner), findsOneWidget);
    });

    testWidgets('supports large text scale without fixed height', (tester) async {
      await tester.pumpWidget(wrap(
        const MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(2)),
          child: AppStatusBanner(
            type: AppStatusType.warning,
            title: 'Longer status title',
            message: 'A message that can wrap onto multiple lines.',
          ),
        ),
      ));
      expect(tester.takeException(), isNull);
      expect(find.text('Longer status title'), findsOneWidget);
    });
  });
}
