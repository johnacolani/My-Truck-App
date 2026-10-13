# Flutter Design System Lab

A standalone Flutter UI toolkit for studying design tokens, reusable components, accessibility, theming, and automated widget tests.

> This is an independent sample project. It does **not** include proprietary client code, restricted mockups, internal documentation, or work repository files.

## Included

- **Foundation:** a generic palette and semantic colors, typography, spacing, sizing, radius, elevation, and gradients.
- **Theme:** light and dark Material themes.
- **Atoms:** a primary/secondary button with loading, disabled, icon, and expanded states.
- **Molecules:** four-kind status banners, input fields, and cards.
- **Organisms:** loading, error, and empty-state views.
- **Template:** a responsive screen scaffold.
- **Quality:** widget tests, accessibility guidance, and a GitHub Actions check.
- **Separate app entrypoints:** a neutral gradient landing-page preview and a development-only design-system demo.

## Get started on a personal Mac

Use a **fresh clone** of this independent repository, not a workplace checkout.

```bash
git clone https://github.com/johnacolani/flutter-design-system-lab.git
cd flutter-design-system-lab
flutter pub get
```

This repository intentionally omits generated native platform directories. On a fresh clone, first generate the macOS platform scaffold locally:

```bash
flutter create --platforms=macos --project-name flutter_design_system_lab .
```

Do **not** repeat the scaffold-generation command in an existing project with customized native platform files without first reviewing or backing up those files.

Launch the **app landing preview** (default):

```bash
flutter run -d macos
```

By default, the landing preview displays **Manifest Truck Mobile**. To try a different title **locally only**, supply a launch-time value:

```bash
flutter run -d macos --dart-define=LAB_PREVIEW_TITLE='Local Preview'
```

The launch-time override is not saved to this repository. The background remains the lab's generic gradient until you replace it with approved sample colors.

Launch the **design-system demo** (explicit development-only target):

```bash
flutter run -d macos -t lib/main_demo.dart
```

Both targets use the same shared design-system library and app theme. The default `lib/main.dart` does not import or launch the demo; the demo is available separately at `lib/main_demo.dart`. The existing example runner at `example/lib/main.dart` is also a demo entrypoint.

The landing preview uses only generic sample colors from `AppGradients.primaryBackground` and a configurable sample title. Its title is configurable through `LandingPreviewScreen(title: '...')`. Replace sample colors or branding only with assets you are authorized to use. No native launch-screen or splash-screen customization has been added yet.

Run quality checks:

```bash
flutter analyze
flutter test
```

Do not commit generated platform files unless you intentionally want to distribute the sample as an app. In particular, keep workplace source files, client assets, and internal documentation out of this repository.

Use the kit from another Flutter package with:

```dart
import 'package:flutter_design_system_lab/design_system.dart';
```

## Design principles

Components accept caller-provided user-facing strings, keeping the library compatible with Flutter localization (English, Spanish, French, and other languages) without bundling application-specific phrases.

Shared components never call a network service. Application-specific state, data sources, navigation, and validation belong to the consuming app. Statuses have icons and text, not only colors, and their layout can grow with accessibility text scaling.

See [Design notes](docs/design_principles.md) and [Accessibility checklist](docs/accessibility.md).

## Progress and verification

This repository provides an independent reference implementation with widget tests and a CI configuration. **Do not assume the tests pass until CI or a local Flutter installation confirms that.** It is not a copy of a workplace project, and its checks do not validate any separate workplace codebase.

## License

No license has been selected. All rights are reserved by default until the repository owner adds a license.
