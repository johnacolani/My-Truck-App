import 'package:flutter/material.dart';

import 'app_size.dart';

/// Semantic font weight tokens used by the generic text styles.
abstract final class AppFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
}

/// Generic text styles with consistent font sizes and line-height ratios.
abstract final class AppTypography {
  static const TextStyle displaySmall = TextStyle(
    fontSize: AppSize.displaySmallFont,
    fontWeight: AppFontWeight.semiBold,
    height: AppSize.displaySmallLineHeight / AppSize.displaySmallFont,
  );

  static const TextStyle appTitle = TextStyle(
    fontSize: AppSize.appTitleFont,
    fontWeight: AppFontWeight.semiBold,
    height: AppSize.appTitleLineHeight / AppSize.appTitleFont,
  );
  static const TextStyle heading = TextStyle(
    fontSize: AppSize.headingFont,
    fontWeight: AppFontWeight.semiBold,
    height: AppSize.headingLineHeight / AppSize.headingFont,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: AppSize.subheadingFont,
    fontWeight: AppFontWeight.semiBold,
    height: AppSize.standardLineHeight / AppSize.subheadingFont,
  );
  static const TextStyle body = TextStyle(
    fontSize: AppSize.bodyFont,
    fontWeight: AppFontWeight.regular,
    height: AppSize.standardLineHeight / AppSize.bodyFont,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: AppSize.bodySmallFont,
    fontWeight: AppFontWeight.regular,
    height: AppSize.compactLineHeight / AppSize.bodySmallFont,
  );
  static const TextStyle label = TextStyle(
    fontSize: AppSize.labelFont,
    fontWeight: AppFontWeight.medium,
    height: AppSize.compactLineHeight / AppSize.labelFont,
  );
  static const TextStyle button = TextStyle(
    fontSize: AppSize.buttonFont,
    fontWeight: AppFontWeight.semiBold,
    height: AppSize.standardLineHeight / AppSize.buttonFont,
  );
  static const TextStyle caption = TextStyle(
    fontSize: AppSize.captionFont,
    fontWeight: AppFontWeight.regular,
    height: AppSize.captionLineHeight / AppSize.captionFont,
  );

  /// Material style mapping for both supported themes.
  static const TextTheme textTheme = TextTheme(
    displaySmall: displaySmall,
    headlineSmall: heading,
    titleLarge: appTitle,
    titleMedium: subheading,
    bodyLarge: body,
    bodyMedium: bodySmall,
    bodySmall: caption,
    labelLarge: button,
    labelMedium: label,
  );
}
