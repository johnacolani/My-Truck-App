import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/app/app.dart';
import 'package:flutter_design_system_lab/app/config/app_config.dart';
import 'package:flutter_design_system_lab/app/router/app_router.dart';

void main() {
  group('DesignSystemLabApp', () {
    testWidgets('renders a supplied home with configured title and theme',
        (tester) async {
      await tester.pumpWidget(
        const DesignSystemLabApp(
          config: AppConfig(appTitle: 'Test Lab'),
          themeMode: ThemeMode.light,
          home: Scaffold(body: Text('Home ready')),
        ),
      );

      expect(find.text('Home ready'), findsOneWidget);
      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.title, 'Test Lab');
      expect(app.themeMode, ThemeMode.light);
      expect(app.debugShowCheckedModeBanner, isFalse);
    });

    testWidgets('routes to a registered example page', (tester) async {
      await tester.pumpWidget(
        DesignSystemLabApp(
          config: const AppConfig(appTitle: 'Test Lab'),
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => Navigator.of(context).pushNamed('/details'),
                child: const Text('Open details'),
              ),
            ),
          ),
          router: AppRouter(
            routes: {
              '/details': (context) =>
                  const Scaffold(body: Text('Detail screen')),
            },
          ),
        ),
      );

      await tester.tap(find.text('Open details'));
      await tester.pumpAndSettle();
      expect(find.text('Detail screen'), findsOneWidget);
    });
  });
}
