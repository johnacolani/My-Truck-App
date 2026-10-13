import 'package:flutter/material.dart';

import 'app.dart';
import 'config/app_config.dart';
import 'landing_preview_screen.dart';

/// Optional launch-time title override for independent local previews.
const _previewTitle = String.fromEnvironment(
  'LAB_PREVIEW_TITLE',
  defaultValue: 'Manifest Truck Mobile',
);

/// The default runnable app, intentionally independent of the component demo.
class LandingPreviewApp extends StatelessWidget {
  const LandingPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesignSystemLabApp(
      config: AppConfig(appTitle: _previewTitle),
      home: LandingPreviewScreen(title: _previewTitle),
    );
  }
}
