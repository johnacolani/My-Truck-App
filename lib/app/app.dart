import 'package:flutter/material.dart';

import '../design_system/theme/app_theme.dart';
import 'config/app_config.dart';
import 'router/app_router.dart';

/// Small, reusable application shell for the independent UI lab.
class DesignSystemLabApp extends StatelessWidget {
  const DesignSystemLabApp({
    super.key,
    required this.config,
    required this.home,
    this.themeMode = ThemeMode.system,
    this.router,
  });

  final AppConfig config;
  final Widget home;
  final ThemeMode themeMode;
  final AppRouter? router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: config.appTitle,
      debugShowCheckedModeBanner: config.showDebugBanner,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      onGenerateRoute: router?.onGenerateRoute,
      home: home,
    );
  }
}
