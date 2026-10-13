import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  group('Foundation token compatibility', () {
    test('font sizes and line heights match their named styles', () {
      final cases = <(TextStyle, double, double)>[
        (AppTypography.appTitle, AppSize.appTitleFont,
            AppSize.appTitleLineHeight),
        (AppTypography.heading, AppSize.headingFont,
            AppSize.headingLineHeight),
        (AppTypography.subheading, AppSize.subheadingFont,
            AppSize.standardLineHeight),
        (AppTypography.body, AppSize.bodyFont,
            AppSize.standardLineHeight),
        (AppTypography.bodySmall, AppSize.bodySmallFont,
            AppSize.compactLineHeight),
        (AppTypography.label, AppSize.labelFont,
            AppSize.compactLineHeight),
        (AppTypography.button, AppSize.buttonFont,
            AppSize.standardLineHeight),
        (AppTypography.caption, AppSize.captionFont,
            AppSize.captionLineHeight),
      ];

      for (final (style, fontSize, lineHeight) in cases) {
        expect(style.fontSize, fontSize);
        expect(style.height! * fontSize, closeTo(lineHeight, 0.0001));
      }
      expect(AppTypography.subheading.fontSize, AppSize.subheadingFont);
      expect(AppTypography.body.height! * AppSize.bodyFont,
          AppSize.standardLineHeight);
    });

    test('original and newer palette names remain equivalent', () {
      expect(AppPalette.primaryBlue, AppPalette.primary);
      expect(AppPalette.primaryBlueDark, AppPalette.primaryDark);
      expect(AppPalette.accentRed, AppPalette.accent);
      expect(AppColors.primaryBackgroundTop, AppPalette.primaryBlue);
      expect(AppColors.primaryBackgroundBottom, AppPalette.primaryBlueDark);
      expect(AppColors.mutedSurface, AppPalette.surfaceMuted);
      expect(AppColors.warmInformationSurface, AppPalette.surfaceWarm);
    });

    test('four status colors have stable semantic roles', () {
      expect(AppColors.statusSuccess, AppPalette.success);
      expect(AppColors.statusSuccessStrong, AppPalette.successStrong);
      expect(AppColors.statusError, AppPalette.error);
      expect(AppColors.statusWarning, AppPalette.warning);
      expect(AppColors.statusInfo, AppPalette.info);
    });

    test('both gradient names use the same generic colors', () {
      expect(
        AppGradients.primaryBackground.colors,
        [AppColors.primaryBackgroundTop, AppColors.primaryBackgroundBottom],
      );
      expect(AppGradients.brand, AppGradients.primaryBackground);
    });

    test('theme maps lab tokens into light and dark variants', () {
      expect(AppTheme.light.appBarTheme.backgroundColor,
          AppColors.primaryBackgroundTop);
      expect(AppTheme.light.scaffoldBackgroundColor,
          AppColors.subtleSurface);
      expect(AppTheme.light.textTheme.titleLarge?.fontSize,
          AppSize.appTitleFont);
      expect(AppTheme.dark.brightness, Brightness.dark);
      expect(AppTheme.light.brightness, Brightness.light);
    });

    test('original spacing, corner, and touch target tokens remain', () {
      expect(AppSpacing.md, 16);
      expect(AppRadius.md, 12);
      expect(AppElevation.medium, 3);
      expect(AppSize.minTouchTarget, 48);
    });
  });
}
