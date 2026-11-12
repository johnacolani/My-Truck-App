import 'app/bootstrap.dart';
import 'app/config/app_config.dart';
import 'app/landing_preview_screen.dart';

/// Default entrypoint: the app preview, not the design-system demo.
///
const appTitle = String.fromEnvironment(
  'LAB_PREVIEW_TITLE',
  defaultValue: 'Manifest Truck Mobile',
);
void main() {
  bootstrap(
    config: const AppConfig(
      appTitle: appTitle,
    ),
    home: const LandingPreviewScreen(
      title: appTitle,
    ),
  );
}
