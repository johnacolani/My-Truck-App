import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  group('Approved palette reference', () {
    test('raw color tokens match the reviewed values', () {
      expect(AppPalette.primaryBlue, const Color(0xFF275185));
      expect(AppPalette.primaryBlueDark, const Color(0xFF17345D));
      expect(AppPalette.accentRed, const Color(0xFFB42B36));
      expect(AppPalette.surfaceCard, const Color(0xFFF8F8F8));
      expect(AppPalette.surfaceSubtle, const Color(0xFFF3F3F3));
      expect(AppPalette.surfaceHighlight, const Color(0xFFCFDDE6));
      expect(AppPalette.surfaceMuted, const Color(0xFFE5E5E6));
      expect(AppPalette.surfaceWarm, const Color(0xFFF6EFDE));
      expect(AppPalette.white, const Color(0xFFFFFFFF));
      expect(AppPalette.textPrimary, const Color(0xFF17212B));
      expect(AppPalette.textSecondary, const Color(0xFF797979));
      expect(AppPalette.textEmphasis, const Color(0xFF090909));
      expect(AppPalette.success, const Color(0xFF51962C));
      expect(AppPalette.successStrong, const Color(0xFF437B21));
      expect(AppPalette.error, const Color(0xFFB7262D));
      expect(AppPalette.warning, const Color(0xFF886B24));
    });

    test('semantic action, information, and surface tokens use the palette', () {
      expect(AppColors.primaryBackgroundTop, AppPalette.primaryBlue);
      expect(AppColors.primaryBackgroundBottom, AppPalette.primaryBlueDark);
      expect(AppColors.primaryAction, AppPalette.accentRed);
      expect(AppColors.actionBorder, AppPalette.accentRed);
      expect(AppColors.actionHighlight, AppPalette.accentRed);
      expect(AppColors.cardSurface, AppPalette.surfaceCard);
      expect(AppColors.subtleSurface, AppPalette.surfaceSubtle);
      expect(AppColors.highlightedSurface, AppPalette.surfaceHighlight);
      expect(AppColors.mutedSurface, AppPalette.surfaceMuted);
      expect(AppColors.warmInformationSurface, AppPalette.surfaceWarm);
      expect(AppColors.secondaryText, AppPalette.textSecondary);
      expect(AppColors.emphasizedText, AppPalette.textEmphasis);
      expect(AppColors.textOnDarkPrimary, AppPalette.white);
      expect(AppColors.statusSuccess, AppPalette.success);
      expect(AppColors.statusSuccessStrong, AppPalette.successStrong);
      expect(AppColors.statusError, AppPalette.error);
      expect(AppColors.statusWarning, AppPalette.warning);
      expect(AppColors.statusInfo, AppPalette.primaryBlue);
    });

    test('theme and gradient consume semantic colors', () {
      expect(
        AppGradients.primaryBackground.colors,
        [AppPalette.primaryBlue, AppPalette.primaryBlueDark],
      );
      expect(AppTheme.light.colorScheme.primary, AppPalette.primaryBlue);
      expect(AppTheme.light.colorScheme.secondary, AppPalette.accentRed);
      expect(AppTheme.light.cardTheme.color, AppPalette.surfaceCard);
      expect(
        AppTheme.light.elevatedButtonTheme.style?.backgroundColor
            ?.resolve(<WidgetState>{}),
        AppPalette.accentRed,
      );
      expect(AppTheme.dark.brightness, Brightness.dark);
      expect(AppTheme.dark.textTheme.bodyLarge?.color,
          AppTheme.dark.colorScheme.onSurface);
    });
  });
}
