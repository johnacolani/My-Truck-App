import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/app/landing_preview_app.dart';
import 'package:flutter_design_system_lab/app/landing_preview_screen.dart';
import 'package:flutter_design_system_lab/design_system/foundation/app_gradients.dart';

void main() {
  testWidgets('default app opens a gradient landing page, not the demo',
      (tester) async {
    await tester.pumpWidget(const LandingPreviewApp());

    expect(find.text('Manifest Truck Mobile'), findsOneWidget);
    expect(find.text('Reusable components'), findsNothing);
    expect(find.text('Primary action'), findsNothing);

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.system);

    final background = tester.widget<DecoratedBox>(
      find.byKey(const Key('landing-gradient')),
    );
    expect(
      (background.decoration as BoxDecoration).gradient,
      AppGradients.primaryBackground,
    );
  });

  testWidgets('the preview title can be supplied by a host app',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LandingPreviewScreen(title: 'Local Preview'),
      ),
    );

    expect(find.text('Local Preview'), findsOneWidget);
    expect(find.text('Design System Lab'), findsNothing);
  });
}
