import 'package:flutter/material.dart';

/// A small, theme-aware type hierarchy.
abstract final class AppTypography {
  static const TextTheme textTheme = TextTheme(
    displaySmall: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.25),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.3),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.4),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.45),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.4),
  );
}
