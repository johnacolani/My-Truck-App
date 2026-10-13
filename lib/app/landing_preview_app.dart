import 'package:flutter/material.dart';

import 'app.dart';
import 'config/app_config.dart';
import 'landing_preview_screen.dart';

/// Optional local-only override keeps client branding out of this public lab.
const _previewTitle = String.fromEnvironment(
  'LAB_PREVIEW_TITLE',
  defaultValue: 'Design System Lab',
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
