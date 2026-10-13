import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  test('exposes matching light and dark schemes', () {
    expect(AppTheme.light.brightness, Brightness.light);
    expect(AppTheme.dark.brightness, Brightness.dark);
    expect(AppSize.minTouchTarget, greaterThanOrEqualTo(48));
    expect(AppSpacing.md, greaterThan(AppSpacing.sm));
    expect(AppRadius.md, greaterThan(AppRadius.sm));
  });
}
