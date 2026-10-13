import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(body: Center(child: child)),
      );

  group('AppButton', () {
    testWidgets('renders label and a primary action', (tester) async {
      await tester.pumpWidget(wrap(const AppButton(label: 'Continue')));
      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('invokes callback on tap', (tester) async {
      var taps = 0;
      await tester.pumpWidget(wrap(AppButton(
        label: 'Continue',
        onPressed: () => taps++,
      )));
      await tester.tap(find.byType(ElevatedButton));
      expect(taps, 1);
    });

    testWidgets('disables button when callback is null', (tester) async {
      await tester.pumpWidget(wrap(const AppButton(label: 'Continue')));
      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(button.onPressed, isNull);
    });

    testWidgets('loading shows progress and blocks callback', (tester) async {
      await tester.pumpWidget(wrap(AppButton(
        label: 'Submit',
        onPressed: () {},
        isLoading: true,
        loadingSemanticsLabel: 'Submitting',
      )));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(button.onPressed, isNull);
    });

    testWidgets('renders secondary variant', (tester) async {
      await tester.pumpWidget(wrap(AppButton(
        label: 'Cancel',
        variant: AppButtonVariant.secondary,
        onPressed: () {},
      )));
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('renders leading icon', (tester) async {
      await tester.pumpWidget(wrap(AppButton(
        label: 'Send',
        leadingIcon: Icons.send,
        onPressed: () {},
      )));
      expect(find.byIcon(Icons.send), findsOneWidget);
    });

    testWidgets('minimum touch target is 48 logical pixels', (tester) async {
      await tester.pumpWidget(wrap(AppButton(
        label: 'Tap',
        onPressed: () {},
      )));
      expect(
        tester.getSize(find.byType(ElevatedButton)).height,
        greaterThanOrEqualTo(kMinInteractiveDimension),
      );
    });

    testWidgets('expand fills available horizontal space', (tester) async {
      await tester.pumpWidget(wrap(SizedBox(
        width: 320,
        child: AppButton(label: 'Wide', onPressed: () {}, expand: true),
      )));
      expect(tester.getSize(find.byType(ElevatedButton)).width, 320);
    });
  });
}
