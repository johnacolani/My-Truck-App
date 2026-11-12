import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'mock/mock_api_interceptor.dart';
import 'mock/mock_api_scenario.dart';

class MockApiSafetyPolicy {
  static void ensureAllowed({
    required bool useMock,
    required bool isDebugBuild,
  }) {
    if (useMock && !isDebugBuild) {
      throw StateError(
        'Mock API is only allowed in Debug builds.',
      );
    }
  }
}

class ApiClientFactory {
  static Dio create({
    required bool useMock,
    String? baseUrl,
    Map<String, MockApiScenario> scenarios = const {},
  }) {
    MockApiSafetyPolicy.ensureAllowed(
      useMock: useMock,
      isDebugBuild: kDebugMode,
    );

    if (useMock) {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://mock.invalid',
        ),
      );

      dio.interceptors.add(
        MockApiInterceptor(scenarios),
      );

      return dio;
    }

    final url = baseUrl?.trim() ?? '';
    final parsed = Uri.tryParse(url);

    if (parsed == null ||
        !parsed.hasAuthority ||
        !['http', 'https'].contains(parsed.scheme)) {
      throw ArgumentError(
        'A valid API_BASE_URL is required '
        'for Real API mode.',
      );
    }

    if (!kDebugMode && parsed.scheme != 'https') {
      throw StateError(
        'Real API requires HTTPS outside Debug.',
      );
    }

    return Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }
}
