import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/demo/design_system_demo.dart';

void main() {
  testWidgets('demo launches with its shared design-system components',
      (tester) async {
    await tester.pumpWidget(const DesignSystemDemo());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Reusable components'), findsOneWidget);
    expect(find.text('Primary action'), findsOneWidget);
    expect(find.text('Saved'), findsOneWidget);
  });

  testWidgets('theme toggle switches the application to dark mode',
      (tester) async {
    await tester.pumpWidget(const DesignSystemDemo());

    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.light,
    );

    await tester.tap(find.byTooltip('Toggle theme'));
    await tester.pump();

    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.dark,
    );
  });
}
