import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Optional gradient for generic demo surfaces.
abstract final class AppGradients {
  static const LinearGradient brand = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppPalette.primary, AppPalette.primaryDark],
  );
}
