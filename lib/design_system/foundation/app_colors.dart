import 'package:flutter/material.dart';

/// Generic sample colors for the independent UI lab.
/// These are NOT values from a workplace or client design system.
abstract final class AppPalette {
  static const Color primary = Color(0xFF384E77);
  static const Color primaryDark = Color(0xFF1D3557);
  static const Color accent = Color(0xFFE76F51);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF6F7FB);
  static const Color subtle = Color(0xFFE9EDF3);
  static const Color highlight = Color(0xFFE9F1FF);
  static const Color muted = Color(0xFFE2E7EF);
  static const Color warm = Color(0xFFFFF4DD);
  static const Color textPrimary = Color(0xFF17212B);
  static const Color textSecondary = Color(0xFF52606D);
  static const Color success = Color(0xFF176C46);
  static const Color successStrong = Color(0xFF105A3A);
  static const Color warning = Color(0xFF805900);
  static const Color error = Color(0xFFAD2737);
  static const Color info = Color(0xFF315EA6);

  // Higher contrast foreground alternatives for dark surfaces.
  static const Color successOnDark = Color(0xFF88E0AF);
  static const Color warningOnDark = Color(0xFFFFD180);
  static const Color errorOnDark = Color(0xFFFF94A1);
  static const Color infoOnDark = Color(0xFF9BC4FF);

  // Naming compatibility aliases for general-purpose UI components.
  static const Color primaryBlue = primary;
  static const Color primaryBlueDark = primaryDark;
  static const Color accentRed = accent;
  static const Color surfaceCard = surface;
  static const Color surfaceSubtle = subtle;
  static const Color surfaceHighlight = highlight;
  static const Color surfaceMuted = muted;
  static const Color surfaceWarm = warm;
  static const Color white = surface;
  static const Color textEmphasis = textPrimary;
}

/// Semantic roles consumed by shared UI widgets.
/// The sample palette intentionally differs from any application branding.
abstract final class AppColors {
  // Raw palette aliases for interoperability with generic sample UIs.
  static const Color primaryBlue = AppPalette.primaryBlue;
  static const Color primaryBlueDark = AppPalette.primaryBlueDark;
  static const Color accentRed = AppPalette.accentRed;

  // Screen backgrounds.
  static const Color primaryBackgroundTop = AppPalette.primaryBlue;
  static const Color primaryBackgroundBottom = AppPalette.primaryBlueDark;

  // Actions.
  static const Color primaryAction = AppPalette.primary;
  static const Color secondaryAction = AppPalette.primaryDark;
  static const Color actionBorder = AppPalette.accent;
  static const Color actionHighlight = AppPalette.accent;

  // Surfaces.
  static const Color cardSurface = AppPalette.surfaceCard;
  static const Color subtleSurface = AppPalette.surfaceSubtle;
  static const Color highlightedSurface = AppPalette.surfaceHighlight;
  static const Color mutedSurface = AppPalette.surfaceMuted;
  static const Color warmSurface = AppPalette.surfaceWarm;
  static const Color warmInformationSurface = AppPalette.surfaceWarm;

  // Text and icons.
  static const Color primaryText = AppPalette.textPrimary;
  static const Color secondaryText = AppPalette.textSecondary;
  static const Color emphasizedText = AppPalette.textEmphasis;
  static const Color textOnDarkPrimary = AppPalette.white;
  static const Color primaryIcon = AppPalette.primaryBlue;
  static const Color buttonText = AppPalette.white;
  static const Color linkTextOnDark = AppPalette.white;

  // Four semantic status colors, plus separate dark-theme foregrounds.
  static const Color statusSuccess = AppPalette.success;
  static const Color statusSuccessStrong = AppPalette.successStrong;
  static const Color statusError = AppPalette.error;
  static const Color statusWarning = AppPalette.warning;
  static const Color statusInfo = AppPalette.info;
  static const Color statusSuccessDark = AppPalette.successOnDark;
  static const Color statusWarningDark = AppPalette.warningOnDark;
  static const Color statusErrorDark = AppPalette.errorOnDark;
  static const Color statusInfoDark = AppPalette.infoOnDark;
}
