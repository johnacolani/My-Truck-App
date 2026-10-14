import 'package:flutter/material.dart';

/// Raw, approved color values matching the shared design-system references.
/// Keep raw colors here; widgets should use AppColors semantic roles.
abstract final class AppPalette {
  static const Color primaryBlue = Color(0xFF275185);
  static const Color primaryBlueDark = Color(0xFF17345D);
  static const Color accentRed = Color(0xFFB42B36);

  static const Color surfaceCard = Color(0xFFF8F8F8);
  static const Color surfaceSubtle = Color(0xFFF3F3F3);
  static const Color surfaceHighlight = Color(0xFFCFDDE6);
  static const Color surfaceMuted = Color(0xFFE5E5E6);
  static const Color surfaceWarm = Color(0xFFF6EFDE);

  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF17212B);
  static const Color textSecondary = Color(0xFF797979);
  static const Color textEmphasis = Color(0xFF090909);

  static const Color success = Color(0xFF51962C);
  static const Color successStrong = Color(0xFF437B21);
  static const Color error = Color(0xFFB7262D);
  static const Color warning = Color(0xFF886B24);

  // Keep compatibility with existing lab clients and tests.
  static const Color primary = primaryBlue;
  static const Color primaryDark = primaryBlueDark;
  static const Color accent = accentRed;
  static const Color surface = surfaceCard;
  static const Color background = surfaceSubtle;
  static const Color subtle = surfaceSubtle;
  static const Color highlight = surfaceHighlight;
  static const Color muted = surfaceMuted;
  static const Color warm = surfaceWarm;
  static const Color info = primaryBlue;

  // Additional accessible foregrounds for dark surfaces. The supplied
  // screenshots specify light-theme statuses, not dark-surface contrast.
  static const Color successOnDark = Color(0xFF88E0AF);
  static const Color warningOnDark = Color(0xFFFFD180);
  static const Color errorOnDark = Color(0xFFFF94A1);
  static const Color infoOnDark = Color(0xFF9BC4FF);
}

/// Semantic color roles used by app components and screens.
abstract final class AppColors {
  // Palette aliases kept for compatibility with existing code.
  static const Color primaryBlue = AppPalette.primaryBlue;
  static const Color primaryBlueDark = AppPalette.primaryBlueDark;
  static const Color accentRed = AppPalette.accentRed;

  // Brand and application background.
  static const Color primaryBackgroundTop = AppPalette.primaryBlue;
  static const Color primaryBackgroundBottom = AppPalette.primaryBlueDark;

  // Actions.
  static const Color primaryAction = AppPalette.accentRed;
  static const Color secondaryAction = AppPalette.primaryBlueDark;
  static const Color actionBorder = AppPalette.accentRed;
  static const Color actionHighlight = AppPalette.accentRed;

  // Surfaces.
  static const Color cardSurface = AppPalette.surfaceCard;
  static const Color subtleSurface = AppPalette.surfaceSubtle;
  static const Color highlightedSurface = AppPalette.surfaceHighlight;
  static const Color mutedSurface = AppPalette.surfaceMuted;
  static const Color warmInformationSurface = AppPalette.surfaceWarm;
  static const Color warmSurface = AppPalette.surfaceWarm;

  // Text and icons.
  static const Color primaryText = AppPalette.textPrimary;
  static const Color textOnDarkPrimary = AppPalette.white;
  static const Color secondaryText = AppPalette.textSecondary;
  static const Color emphasizedText = AppPalette.textEmphasis;
  static const Color primaryIcon = AppPalette.primaryBlue;
  static const Color buttonText = AppPalette.white;
  static const Color linkTextOnDark = AppPalette.white;

  // Semantic status colors.
  static const Color statusSuccess = AppPalette.success;
  static const Color statusSuccessStrong = AppPalette.successStrong;
  static const Color statusError = AppPalette.error;
  static const Color statusWarning = AppPalette.warning;
  static const Color statusInfo = AppPalette.primaryBlue;

  // Dark-surface foreground tokens retained for readable status messages.
  static const Color statusSuccessDark = AppPalette.successOnDark;
  static const Color statusWarningDark = AppPalette.warningOnDark;
  static const Color statusErrorDark = AppPalette.errorOnDark;
  static const Color statusInfoDark = AppPalette.infoOnDark;
}
