import 'package:flutter/material.dart';

/// Routes are supplied by the sample application, not the design system.
class AppRouter {
  const AppRouter({required this.routes});

  final Map<String, WidgetBuilder> routes;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder == null) return null;

    return MaterialPageRoute<void>(
      settings: settings,
      builder: builder,
    );
  }
}
