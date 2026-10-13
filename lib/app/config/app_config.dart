import 'environment.dart';

/// Immutable configuration supplied by the host application.
class AppConfig {
  const AppConfig({
    required this.appTitle,
    this.environment = AppEnvironment.development,
    this.showDebugBanner = false,
  });

  final String appTitle;
  final AppEnvironment environment;
  final bool showDebugBanner;
}
