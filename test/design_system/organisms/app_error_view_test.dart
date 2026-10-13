import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  testWidgets('recoverable error displays retry callback', (tester) async {
    var retryCount = 0;
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: AppErrorView(
          title: 'Unavailable',
          message: 'Try again later.',
          retryLabel: 'Retry',
          onRetry: () => retryCount++,
        ),
      ),
    ));
    expect(find.text('Unavailable'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retryCount, 1);
  });
}
