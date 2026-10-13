import 'package:flutter/material.dart';

import 'app.dart';
import 'config/app_config.dart';
import 'router/app_router.dart';

/// Initializes Flutter and runs the standalone sample application.
void bootstrap({
  required AppConfig config,
  required Widget home,
  ThemeMode themeMode = ThemeMode.system,
  AppRouter? router,
}) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DesignSystemLabApp(
      config: config,
      home: home,
      themeMode: themeMode,
      router: router,
    ),
  );
}
