import 'package:flutter/material.dart';

import '../foundation/app_component_size.dart';
import '../foundation/app_spacing.dart';

enum AppButtonVariant { primary, secondary }

/// Reusable action with loading, enabled/disabled, and layout states.
///
/// Labels and loading announcements are supplied by the consuming app.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.expand = false,
    this.leadingIcon,
    this.loadingSemanticsLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool expand;
  final IconData? leadingIcon;
  final String? loadingSemanticsLabel;

  @override
  Widget build(BuildContext context) {
    final enabledCallback = isLoading ? null : onPressed;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          const SizedBox(
            width: AppComponentSize.progressIndicator,
            height: AppComponentSize.progressIndicator,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: AppSpacing.sm),
        ] else if (leadingIcon != null) ...[
          Icon(leadingIcon, size: AppComponentSize.icon),
          const SizedBox(width: AppSpacing.sm),
        ],
        Flexible(child: Text(label, textAlign: TextAlign.center)),
      ],
    );

    final ButtonStyle minSize = ElevatedButton.styleFrom(
      minimumSize: const Size(0, AppComponentSize.minTouchTarget),
    );

    final Widget button = switch (variant) {
      AppButtonVariant.primary => ElevatedButton(
          onPressed: enabledCallback,
          style: minSize,
          child: content,
        ),
      AppButtonVariant.secondary => OutlinedButton(
          onPressed: enabledCallback,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, AppComponentSize.minTouchTarget),
          ),
          child: content,
        ),
    };
    final annotated = Semantics(
      value: isLoading ? loadingSemanticsLabel : null,
      child: button,
    );

    if (expand) {
      return SizedBox(width: double.infinity, child: annotated);
    }
    return annotated;
  }
}
