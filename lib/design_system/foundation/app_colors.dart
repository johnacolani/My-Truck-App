import 'package:flutter/material.dart';

/// Raw color values from the approved Confluence color Table.
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

  // Status colors from the approved Confluence Design System.
  static const Color success = Color(0xFF51962C);
  static const Color successStrong = Color(0xFF437B21);
  static const Color error = Color(0xFFB7262D);
  static const Color warning = Color(0xFF886B24);
}

/// Semantic color roles used by app components and screens.
abstract final class AppColors {
  // Kept for compatibility with the existing color-token commit.
  static const Color primaryBlue = AppPalette.primaryBlue;
  static const Color primaryBlueDark = AppPalette.primaryBlueDark;
  static const Color accentRed = AppPalette.accentRed;

  // Brand and application background.
  static const Color primaryBackgroundTop = AppPalette.primaryBlue;
  static const Color primaryBackgroundBottom = AppPalette.primaryBlueDark;

  // Actions.
  static const Color primaryAction = AppPalette.accentRed;
  static const Color actionBorder = AppPalette.accentRed;
  static const Color actionHighlight = AppPalette.accentRed;

  // Surfaces.
  static const Color cardSurface = AppPalette.surfaceCard;
  static const Color subtleSurface = AppPalette.surfaceSubtle;
  static const Color highlightedSurface = AppPalette.surfaceHighlight;
  static const Color mutedSurface = AppPalette.surfaceMuted;
  static const Color warmInformationSurface = AppPalette.surfaceWarm;

  // Text and icons.
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
}
