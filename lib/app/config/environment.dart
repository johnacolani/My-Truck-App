/// Identifies the running environment for a standalone sample application.
enum AppEnvironment {
  development,
  staging,
  production;

  bool get isProduction => this == AppEnvironment.production;
}
