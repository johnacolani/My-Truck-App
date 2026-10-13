import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../foundation/app_radius.dart';
import '../foundation/app_size.dart';
import '../foundation/app_spacing.dart';

enum AppStatusType { success, warning, error, info }

/// Accessible status banner without application-specific state or text.
///
/// [title] and [message] must be localized by the consuming application.
class AppStatusBanner extends StatelessWidget {
  const AppStatusBanner({
    super.key,
    required this.type,
    required this.title,
    required this.message,
    this.semanticsLabel,
  });

  final AppStatusType type;
  final String title;
  final String message;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final foreground = _foregroundColor(dark);
    final background = foreground.withValues(alpha: dark ? 0.18 : 0.09);

    return Semantics(
      container: true,
      label: semanticsLabel ?? '$title. $message',
      child: ExcludeSemantics(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: background,
            border: Border.all(color: foreground.withValues(alpha: 0.6)),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_icon, size: AppSize.icon, color: foreground),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: foreground),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: foreground),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData get _icon => switch (type) {
        AppStatusType.success => Icons.check_circle_outline,
        AppStatusType.warning => Icons.warning_amber_rounded,
        AppStatusType.error => Icons.error_outline,
        AppStatusType.info => Icons.info_outline,
      };

  Color _foregroundColor(bool dark) => switch (type) {
        AppStatusType.success =>
          dark ? AppColors.statusSuccessDark : AppColors.statusSuccess,
        AppStatusType.warning =>
          dark ? AppColors.statusWarningDark : AppColors.statusWarning,
        AppStatusType.error =>
          dark ? AppColors.statusErrorDark : AppColors.statusError,
        AppStatusType.info =>
          dark ? AppColors.statusInfoDark : AppColors.statusInfo,
      };
}
