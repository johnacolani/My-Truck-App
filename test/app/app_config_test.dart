import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/app/config/app_config.dart';
import 'package:flutter_design_system_lab/app/config/environment.dart';

void main() {
  test('development configuration is the default', () {
    const config = AppConfig(appTitle: 'Sample');
    expect(config.environment, AppEnvironment.development);
    expect(config.showDebugBanner, isFalse);
    expect(config.appTitle, 'Sample');
  });

  test('environment differentiates production', () {
    expect(AppEnvironment.production.isProduction, isTrue);
    expect(AppEnvironment.staging.isProduction, isFalse);
    expect(AppEnvironment.development.isProduction, isFalse);
  });
}
