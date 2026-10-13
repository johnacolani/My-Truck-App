import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  testWidgets('labels input and reports changes', (tester) async {
    var latest = '';
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AppTextField(
          label: 'Reference',
          onChanged: (value) => latest = value,
        ),
      ),
    ));
    expect(find.text('Reference'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'ABC123');
    expect(latest, 'ABC123');
  });

  testWidgets('shows a validation error from its caller', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AppTextField(
          label: 'Reference',
          errorText: 'Enter a valid reference',
        ),
      ),
    ));
    expect(find.text('Enter a valid reference'), findsOneWidget);
  });
}
