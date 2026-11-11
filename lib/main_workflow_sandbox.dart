import 'package:flutter/material.dart';

import 'design_system/theme/app_theme.dart';
import 'workflow_sandbox/screens/landing_screen.dart';
import 'workflow_sandbox/screens/splash_screen.dart';
import 'workflow_sandbox/screens/terms_screen.dart';

/// Standalone, independently written UI exercise.
/// It is not a client, government, or employer application.
void main() => runApp(const WorkflowSandboxApp());

enum _DemoStage { splash, landing, terms }

class WorkflowSandboxApp extends StatefulWidget {
  const WorkflowSandboxApp({
    super.key,
    this.splashDuration = const Duration(milliseconds: 2100),
  });

  final Duration splashDuration;

  @override
  State<WorkflowSandboxApp> createState() => _WorkflowSandboxAppState();
}

class _WorkflowSandboxAppState extends State<WorkflowSandboxApp> {
  _DemoStage _stage = _DemoStage.splash;
  String _language = 'en';

  void _changeLanguage(String language) {
    if (language == 'en' || language == 'es' || language == 'fr') {
      setState(() => _language = language);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget page;
    switch (_stage) {
      case _DemoStage.splash:
        page = SandboxSplashScreen(
          duration: widget.splashDuration,
          onComplete: () {
            if (mounted) setState(() => _stage = _DemoStage.landing);
          },
        );
      case _DemoStage.landing:
        page = SandboxLandingScreen(
          language: _language,
          onLanguageChanged: _changeLanguage,
          onOpenTerms: () => setState(() => _stage = _DemoStage.terms),
        );
      case _DemoStage.terms:
        page = SandboxTermsScreen(
          language: _language,
          onLanguageChanged: _changeLanguage,
          onBack: () => setState(() => _stage = _DemoStage.landing),
        );
    }

    return MaterialApp(
      title: 'Truck Workflow Lab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: page,
    );
  }
}
