import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../foundation/app_elevation.dart';
import '../foundation/app_radius.dart';
import '../foundation/app_size.dart';
import '../foundation/app_typography.dart';

/// Light and dark themes built from the lab's independent, generic tokens.
abstract final class AppTheme {
  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? scheme.surface : AppColors.subtleSurface,
      textTheme: AppTypography.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDark ? scheme.surface : AppColors.primaryBackgroundTop,
        foregroundColor:
            isDark ? scheme.onSurface : AppColors.textOnDarkPrimary,
        elevation: AppElevation.none,
      ),
      cardTheme: CardThemeData(
        color: isDark ? scheme.surfaceContainer : AppColors.cardSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, AppSize.buttonHeight),
          backgroundColor:
              isDark ? scheme.primary : AppColors.primaryAction,
          foregroundColor:
              isDark ? scheme.onPrimary : AppColors.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, AppSize.buttonHeight),
          foregroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
    );
  }
}
