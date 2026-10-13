import 'package:flutter/material.dart';

/// Generic dimensions for sample UI components, separate from typography.
/// AppSize deliberately contains font and line-height values only.
abstract final class AppComponentSize {
  static const double minTouchTarget = kMinInteractiveDimension;
  static const double buttonHeight = kMinInteractiveDimension;
  static const double icon = 20;
  static const double smallIcon = 18;
  static const double progressIndicator = 18;
  static const double contentMaxWidth = 720;
}
