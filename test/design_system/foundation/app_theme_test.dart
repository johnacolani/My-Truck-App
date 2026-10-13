import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() {
  group('AppTheme', () {
    test('exposes matching light and dark color schemes', () {
      final light = AppTheme.light;
      final dark = AppTheme.dark;

      expect(light.brightness, Brightness.light);
      expect(dark.brightness, Brightness.dark);
      expect(light.colorScheme.brightness, Brightness.light);
      expect(dark.colorScheme.brightness, Brightness.dark);
      expect(light.useMaterial3, isTrue);
      expect(dark.useMaterial3, isTrue);
    });

    test('light theme preserves semantic sample colors', () {
      final theme = AppTheme.light;

      expect(theme.colorScheme.primary, AppColors.primaryBlue);
      expect(theme.colorScheme.onPrimary, AppColors.textOnDarkPrimary);
      expect(theme.colorScheme.secondary, AppColors.accentRed);
      expect(theme.colorScheme.onSecondary, AppColors.buttonText);
      expect(theme.colorScheme.surface, AppColors.cardSurface);
      expect(theme.colorScheme.onSurface, AppColors.emphasizedText);
      expect(theme.scaffoldBackgroundColor, AppColors.subtleSurface);
      expect(theme.appBarTheme.backgroundColor,
          AppColors.primaryBackgroundTop);
      expect(theme.appBarTheme.foregroundColor,
          AppColors.textOnDarkPrimary);
      expect(theme.appBarTheme.elevation, AppElevation.none);
    });

    test('both themes reuse tokens and use appropriate text colors', () {
      final light = AppTheme.light;
      final dark = AppTheme.dark;

      expect(light.textTheme.titleLarge?.fontSize, AppSize.appTitleFont);
      expect(dark.textTheme.titleLarge?.fontSize, AppSize.appTitleFont);
      expect(light.textTheme.bodyLarge?.color, AppColors.emphasizedText);
      expect(light.textTheme.displaySmall?.color, AppColors.emphasizedText);
      expect(dark.textTheme.bodyLarge?.color, dark.colorScheme.onSurface);
      expect(dark.textTheme.displaySmall?.color, dark.colorScheme.onSurface);
      expect(dark.scaffoldBackgroundColor, dark.colorScheme.surface);
      expect(dark.appBarTheme.backgroundColor, dark.colorScheme.surface);
      expect(dark.appBarTheme.foregroundColor, dark.colorScheme.onSurface);
    });

    test('cards and both button variants use component tokens', () {
      for (final theme in [AppTheme.light, AppTheme.dark]) {
        final cardShape = theme.cardTheme.shape! as RoundedRectangleBorder;
        expect(cardShape.borderRadius, BorderRadius.circular(AppRadius.md));

        final elevated = theme.elevatedButtonTheme.style!;
        final outlined = theme.outlinedButtonTheme.style!;
        expect(
          elevated.minimumSize!.resolve(<WidgetState>{})!.height,
          AppComponentSize.buttonHeight,
        );
        expect(
          outlined.minimumSize!.resolve(<WidgetState>{})!.height,
          AppComponentSize.buttonHeight,
        );
        final elevatedShape = elevated.shape!
            .resolve(<WidgetState>{})! as RoundedRectangleBorder;
        final outlinedShape = outlined.shape!
            .resolve(<WidgetState>{})! as RoundedRectangleBorder;
        expect(elevatedShape.borderRadius, BorderRadius.circular(AppRadius.md));
        expect(outlinedShape.borderRadius, BorderRadius.circular(AppRadius.md));
      }
      expect(AppComponentSize.minTouchTarget, greaterThanOrEqualTo(48));
    });

    testWidgets('MaterialApp can select dark mode', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        home: const Scaffold(body: Text('Theme sample')),
      ));

      final context = tester.element(find.text('Theme sample'));
      expect(Theme.of(context).brightness, Brightness.dark);
      expect(Theme.of(context).textTheme.bodyLarge?.color,
          Theme.of(context).colorScheme.onSurface);
    });
  });
}
