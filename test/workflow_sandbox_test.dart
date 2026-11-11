import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/main_workflow_sandbox.dart';

void main() {
  Future<void> finishSplash(WidgetTester tester) async {
    await tester.pumpWidget(
      const WorkflowSandboxApp(
        splashDuration: Duration(milliseconds: 1800),
      ),
    );
    expect(find.byKey(const Key('sandbox-splash')), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 1900));
    await tester.pumpAndSettle();
  }

  testWidgets('splash leads to landing and sample terms', (tester) async {
    await finishSplash(tester);
    expect(find.byKey(const Key('sandbox-landing')), findsOneWidget);

    await tester.tap(find.byKey(const Key('open-sample-terms')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('sandbox-terms')), findsOneWidget);
    expect(find.text('Sample terms of use'), findsOneWidget);

    final confirm = find.byKey(const Key('confirm-sample-terms'));
    expect(tester.widget<ElevatedButton>(confirm).onPressed, isNull);

    await tester.tap(find.byKey(const Key('accept-demo-checkbox')));
    await tester.pump();
    expect(tester.widget<ElevatedButton>(confirm).onPressed, isNotNull);
    await tester.ensureVisible(confirm);
    await tester.pumpAndSettle();
    await tester.tap(confirm);
    await tester.pump();
    expect(find.text('Accepted in this local demo.'), findsOneWidget);

    await tester.tap(find.byKey(const Key('back-to-landing')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('sandbox-landing')), findsOneWidget);
  });

  testWidgets('language selection carries from landing to terms', (tester) async {
    await finishSplash(tester);

    await tester.tap(find.byKey(const Key('demo-language')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Español').last);
    await tester.pumpAndSettle();

    expect(find.text('Leer condiciones de ejemplo'), findsOneWidget);
    await tester.tap(find.byKey(const Key('open-sample-terms')));
    await tester.pumpAndSettle();
    expect(find.text('Condiciones de ejemplo'), findsOneWidget);

    await tester.tap(find.byKey(const Key('demo-language')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Français').last);
    await tester.pumpAndSettle();
    expect(find.text('Conditions de démonstration'), findsOneWidget);
  });
}
