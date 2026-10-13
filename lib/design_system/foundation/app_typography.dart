import 'package:flutter/material.dart';

import 'app_size.dart';

/// Generic text styles with consistent font sizes and line-height ratios.
abstract final class AppTypography {
  static const TextStyle appTitle = TextStyle(
    fontSize: AppSize.appTitleFont,
    fontWeight: FontWeight.w600,
    height: AppSize.appTitleLineHeight / AppSize.appTitleFont,
  );
  static const TextStyle heading = TextStyle(
    fontSize: AppSize.headingFont,
    fontWeight: FontWeight.w600,
    height: AppSize.headingLineHeight / AppSize.headingFont,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: AppSize.subheadingFont,
    fontWeight: FontWeight.w600,
    height: AppSize.standardLineHeight / AppSize.subheadingFont,
  );
  static const TextStyle body = TextStyle(
    fontSize: AppSize.bodyFont,
    fontWeight: FontWeight.w400,
    height: AppSize.standardLineHeight / AppSize.bodyFont,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: AppSize.bodySmallFont,
    fontWeight: FontWeight.w400,
    height: AppSize.compactLineHeight / AppSize.bodySmallFont,
  );
  static const TextStyle label = TextStyle(
    fontSize: AppSize.labelFont,
    fontWeight: FontWeight.w500,
    height: AppSize.compactLineHeight / AppSize.labelFont,
  );
  static const TextStyle button = TextStyle(
    fontSize: AppSize.buttonFont,
    fontWeight: FontWeight.w600,
    height: AppSize.standardLineHeight / AppSize.buttonFont,
  );
  static const TextStyle caption = TextStyle(
    fontSize: AppSize.captionFont,
    fontWeight: FontWeight.w400,
    height: AppSize.captionLineHeight / AppSize.captionFont,
  );

  /// Material style mapping for both supported themes.
  static const TextTheme textTheme = TextTheme(
    displaySmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
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
