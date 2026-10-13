import 'package:flutter/material.dart';

/// Generic sample palette. Not sourced from any client brand system.
abstract final class AppPalette {
  static const primary = Color(0xFF384E77);
  static const primaryDark = Color(0xFF1D3557);
  static const accent = Color(0xFFE76F51);
  static const surface = Color(0xFFFFFFFF);
  static const background = Color(0xFFF6F7FB);
  static const subtle = Color(0xFFE9EDF3);
  static const highlight = Color(0xFFE9F1FF);
  static const warm = Color(0xFFFFF4DD);
  static const textPrimary = Color(0xFF17212B);
  static const textSecondary = Color(0xFF52606D);
  static const success = Color(0xFF176C46);
  static const successStrong = Color(0xFF105A3A);
  static const warning = Color(0xFF805900);
  static const error = Color(0xFFAD2737);
  static const info = Color(0xFF315EA6);

  // Brighter foreground colors for dark surfaces.
  static const successOnDark = Color(0xFF88E0AF);
  static const warningOnDark = Color(0xFFFFD180);
  static const errorOnDark = Color(0xFFFF94A1);
  static const infoOnDark = Color(0xFF9BC4FF);
}

/// Semantic roles consumed by shared UI widgets.
abstract final class AppColors {
  static const primaryAction = AppPalette.primary;
  static const secondaryAction = AppPalette.primaryDark;
  static const actionHighlight = AppPalette.accent;
  static const cardSurface = AppPalette.surface;
  static const subtleSurface = AppPalette.subtle;
  static const highlightedSurface = AppPalette.highlight;
  static const warmSurface = AppPalette.warm;
  static const primaryText = AppPalette.textPrimary;
  static const secondaryText = AppPalette.textSecondary;
  static const statusSuccess = AppPalette.success;
  static const statusSuccessStrong = AppPalette.successStrong;
  static const statusWarning = AppPalette.warning;
  static const statusError = AppPalette.error;
  static const statusInfo = AppPalette.info;
  static const statusSuccessDark = AppPalette.successOnDark;
  static const statusWarningDark = AppPalette.warningOnDark;
  static const statusErrorDark = AppPalette.errorOnDark;
  static const statusInfoDark = AppPalette.infoOnDark;
}
