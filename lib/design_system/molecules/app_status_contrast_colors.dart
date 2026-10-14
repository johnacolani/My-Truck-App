import 'package:flutter/material.dart';

/// Lab-only foreground colors for accessible status banners on dark surfaces.
///
/// These are deliberately outside app_colors.dart, whose palette and semantic
/// roles mirror the approved light-theme color reference without extra tokens.
abstract final class AppStatusContrastColors {
  static const Color successOnDark = Color(0xFF88E0AF);
  static const Color warningOnDark = Color(0xFFFFD180);
  static const Color errorOnDark = Color(0xFFFF94A1);
  static const Color infoOnDark = Color(0xFF9BC4FF);
}
