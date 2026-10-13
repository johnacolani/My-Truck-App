import 'package:flutter/material.dart';

import '../foundation/app_spacing.dart';

/// Generic progress view with a localized progress announcement.
class AppLoadingView extends StatelessWidget {
  const AppLoadingView({
    super.key,
    required this.semanticsLabel,
    this.message,
  });

  final String semanticsLabel;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(semanticsLabel: semanticsLabel),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(message!, textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
