import 'package:flutter/material.dart';

import 'app.dart';
import 'config/app_config.dart';
import 'di/network_bootstrap.dart';
import 'router/app_router.dart';

/// Initializes Flutter and runs the standalone sample application.
void bootstrap({
  required AppConfig config,
  required Widget home,
  ThemeMode themeMode = ThemeMode.system,
  AppRouter? router,
}) {
  WidgetsFlutterBinding.ensureInitialized();
  // CNII-104: Initialize shared network dependencies
  const useMock = bool.fromEnvironment(
    'USE_MOCK_API',
    defaultValue: false,
  );

  const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
  );
  initializeNetworkDependencies(
    useMock: useMock,
    baseUrl: baseUrl.isEmpty ? null : baseUrl,
  );
  runApp(
    DesignSystemLabApp(
      config: config,
      home: home,
      themeMode: themeMode,
      router: router,
    ),
  );
}
