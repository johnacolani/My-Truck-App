# Foundation API compatibility

This document describes the **independent sample** naming conventions used
by Flutter Design System Lab. The colors and source code are original,
generic samples; they are not client or workplace design tokens.

## Compatibility surface

- `AppSize`: typography font sizes and line heights only.
- `AppComponentSize`: standalone lab component dimensions for touch targets,
  buttons, icons, loading indicators, and layout widths. This additional
  utility is **not** part of the shared typography token API.
- `AppTypography`: `appTitle`, `heading`, `subheading`, `body`,
  `bodySmall`, `label`, `button`, and `caption`. Existing
  `textTheme` remains available for Material components.
- `AppSpacing`: `xs`, `sm`, `md`, `lg`, `xl`, `xxl`.
- `AppRadius`: `xs`, `sm`, `md`, `lg`, `xl`, `full`.
- `AppElevation`: `none`, `low`, `medium`, `high`, `overlay`.
- `AppColors`: generic background, action, surface, and text/icon roles.
  Status roles include `statusSuccess`, `statusSuccessStrong`,
  `statusError`, `statusWarning`, and `statusInfo`.
- `AppGradients`: both `primaryBackground` and the old `brand` alias.
- `AppTheme.light` and `AppTheme.dark`: sample Material themes.

## Typography

TextStyle `height` is a multiplier. For example, a 16px body with a 24px
line height must use `height: 24 / 16`, not `20 / 14`.
A 16px subheading should reference `subheadingFont`, not `headingFont`.

## Integration notes

Do not replace an app's theme or palette automatically: code that uses
these generic interfaces must still be reviewed and adapted to the
consuming app's own accessible colors, component behavior, localizations,
and design approval process.

Tests in `test/design_system/foundation/foundation_compatibility_test.dart`
exercise the common names, ratios, and four status color mappings.
Run `flutter analyze` and `flutter test` before accepting updates.
