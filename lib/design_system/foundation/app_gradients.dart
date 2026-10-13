import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Reusable sample background gradients.
abstract final class AppGradients {
  static const LinearGradient primaryBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primaryBackgroundTop,
      AppColors.primaryBackgroundBottom,
    ],
  );

  // Keep the original lab API working.
  static const LinearGradient brand = primaryBackground;
}
