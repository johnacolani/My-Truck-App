import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../foundation/app_component_size.dart';
import '../foundation/app_elevation.dart';
import '../foundation/app_radius.dart';
import '../foundation/app_typography.dart';

/// Light/dark Material themes using the approved color and component tokens.
/// Dark surface/onSurface roles are derived for legible contrast.
abstract final class AppTheme {
  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    // Keep sample light roles explicit rather than deriving them from a seed.
    // The darker scheme uses Material 3-generated surface/onSurface pairs.
    final ColorScheme scheme = isDark
        ? ColorScheme.fromSeed(
            seedColor: AppColors.primaryBlue,
            brightness: Brightness.dark,
          )
        : const ColorScheme.light(
            primary: AppColors.primaryBlue,
            onPrimary: AppColors.textOnDarkPrimary,
            secondary: AppColors.accentRed,
            onSecondary: AppColors.buttonText,
            surface: AppColors.cardSurface,
            onSurface: AppColors.emphasizedText,
          );

    final foreground = isDark ? scheme.onSurface : AppColors.emphasizedText;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? scheme.surface : AppColors.subtleSurface,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: foreground,
        displayColor: foreground,
      ),
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
          minimumSize: const Size(0, AppComponentSize.buttonHeight),
          backgroundColor: isDark ? scheme.primary : AppColors.primaryAction,
          foregroundColor: isDark ? scheme.onPrimary : AppColors.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, AppComponentSize.buttonHeight),
          foregroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
    );
  }
}
