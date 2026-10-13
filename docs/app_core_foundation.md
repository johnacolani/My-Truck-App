# Application and core foundation

This branch adds a small, independent Flutter application shell and general-purpose
utilities to the **Flutter Design System Lab**. It does not replicate a workplace
repository and does not contain organizational integrations, endpoints, credentials,
mockups, or internal data.

## Structure

```text
lib/
  app/
    app.dart
    bootstrap.dart
    config/
      app_config.dart
      environment.dart
    router/
      app_router.dart
  core/
    error/
      exceptions.dart
      failures.dart
    result/
      result.dart
    utils/
      input_validators.dart
  design_system/
    ...
test/
  app/
    app_test.dart
    app_config_test.dart
  core/
    error/exceptions_test.dart
    result/result_test.dart
    utils/input_validators_test.dart
  design_system/
    ...
```

## Boundaries

- **App** configures the host `MaterialApp`, its themes, and caller-defined routes.
- **Core** provides typed failures, error results, and small shared validators.
- **Design System** provides reusable presentation components without business
  logic, backend models, or network calls.
- The consuming application provides localized user-facing text and any feature
  modules; no enterprise-specific routes or API dependencies are included.

## Integration example

```dart
const config = AppConfig(appTitle: 'UI Lab');
bootstrap(
  config: config,
  home: const Scaffold(body: Center(child: Text('Ready'))),
);
```

Import the app classes from their files; the existing `design_system.dart`
barrel intentionally continues to export presentation code only.

## Verification

Run `flutter pub get`, `flutter analyze`, and `flutter test` with a
locally installed Flutter SDK, or review the GitHub Actions result.

The new tests cover basic app rendering and routing, configuration,
exception formatting, success/failure results, and input validation.
These checks do **not** replace device-based accessibility checks or
end-to-end application tests.

Do not assume checks pass until the CI workflow completes successfully.
