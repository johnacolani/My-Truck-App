import 'package:dio/dio.dart';

import 'mock_api_scenario.dart';

class MockApiInterceptor extends Interceptor {
  MockApiInterceptor(
    Map<String, MockApiScenario> scenarios,
  ) : _scenarios = Map.unmodifiable({
          for (final entry in scenarios.entries)
            _normalizeRoute(entry.key): entry.value,
        });

  final Map<String, MockApiScenario> _scenarios;

  static String _normalizePath(String path) {
    if (path.length > 1 && path.endsWith('/')) {
      return path.substring(0, path.length - 1);
    }
    return path;
  }

  static String _normalizeRoute(String route) {
    final parts = route.trim().split(RegExp(r'\s+'));

    if (parts.length != 2) {
      throw ArgumentError(
        'Expected route format: GET /path',
      );
    }

    return '${parts[0].toUpperCase()} '
        '${_normalizePath(Uri.parse(parts[1]).path)}';
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final route = _normalizeRoute(
      '${options.method} ${options.uri.path}',
    );

    final scenario = _scenarios[route];

    // Never forward an unregistered mock request
    // to a real backend.
    if (scenario == null) {
      final response = Response<dynamic>(
        requestOptions: options,
        statusCode: 404,
        data: {
          'message': 'No mock registered for $route',
        },
      );

      handler.reject(
        DioException(
          requestOptions: options,
          response: response,
          type: DioExceptionType.badResponse,
        ),
      );
      return;
    }

    // Simulate network latency.
    if (scenario.delay > Duration.zero) {
      await Future<void>.delayed(scenario.delay);
    }

    // Simulate timeout.
    if (scenario.failureType == MockFailureType.timeout) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionTimeout,
          message: 'Mock API timeout',
        ),
      );
      return;
    }

    // Simulate connection failure.
    if (scenario.failureType == MockFailureType.connectionError) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          message: 'Mock connection failure',
        ),
      );
      return;
    }

    final response = Response<dynamic>(
      requestOptions: options,
      statusCode: scenario.statusCode,
      data: scenario.body,
    );

    // Simulate HTTP errors.
    if (scenario.statusCode >= 400) {
      handler.reject(
        DioException(
          requestOptions: options,
          response: response,
          type: DioExceptionType.badResponse,
        ),
      );
      return;
    }

    // Return a successful mock response.
    handler.resolve(response);
  }
}
