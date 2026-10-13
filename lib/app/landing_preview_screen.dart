import 'package:flutter/material.dart';

import '../design_system/foundation/app_colors.dart';
import '../design_system/foundation/app_gradients.dart';
import '../design_system/foundation/app_spacing.dart';

/// A neutral sample landing page; supply an approved product name in the host app.
class LandingPreviewScreen extends StatelessWidget {
  const LandingPreviewScreen({
    super.key,
    this.title = 'Design System Lab',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        key: const Key('landing-gradient'),
        decoration: const BoxDecoration(
          gradient: AppGradients.primaryBackground,
        ),
        child: SizedBox.expand(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.textOnDarkPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
