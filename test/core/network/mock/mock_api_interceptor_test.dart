import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/core/network/mock/mock_api_scenario.dart';
import '../../../../lib/core/network/mock/mock_api_interceptor.dart';

Dio createMockDio(
  Map<String, MockApiScenario> scenarios,
) {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://mock.invalid'),
  );

  dio.interceptors.add(
    MockApiInterceptor(scenarios),
  );

  return dio;
}

void main() {
  group('MockApiInterceptor', () {
    test('returns HTTP 200 and mock data', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.success(
          body: {'status': 'success'},
        ),
      });

      final response = await dio.get('/__mock__/health');

      expect(response.statusCode, 200);
      expect(response.data['status'], 'success');
    });

    test('returns HTTP 400 error', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.httpError(statusCode: 400),
      });

      await expectLater(
        dio.get('/__mock__/health'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            400,
          ),
        ),
      );
    });

    test('returns HTTP 401 error', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.httpError(statusCode: 401),
      });

      await expectLater(
        dio.get('/__mock__/health'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            401,
          ),
        ),
      );
    });

    test('returns HTTP 500 error', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.httpError(statusCode: 500),
      });

      await expectLater(
        dio.get('/__mock__/health'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            500,
          ),
        ),
      );
    });

    test('simulates timeout', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.timeout(),
      });

      await expectLater(
        dio.get('/__mock__/health'),
        throwsA(
          isA<DioException>().having(
            (e) => e.type,
            'error type',
            DioExceptionType.connectionTimeout,
          ),
        ),
      );
    });

    test('simulates connection error', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.connectionError(),
      });

      await expectLater(
        dio.get('/__mock__/health'),
        throwsA(
          isA<DioException>().having(
            (e) => e.type,
            'error type',
            DioExceptionType.connectionError,
          ),
        ),
      );
    });

    test('simulates response delay', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.success(
          delay: const Duration(milliseconds: 30),
        ),
      });

      final stopwatch = Stopwatch()..start();

      await dio.get('/__mock__/health');

      stopwatch.stop();

      expect(
        stopwatch.elapsedMilliseconds,
        greaterThanOrEqualTo(20),
      );
    });

    test('rejects unregistered mock endpoints', () async {
      final dio = createMockDio({});

      await expectLater(
        dio.get('/unknown'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            404,
          ),
        ),
      );
    });

    test('ignores query parameters when matching', () async {
      final dio = createMockDio({
        'GET /__mock__/health': MockApiScenario.success(
          body: {'ok': true},
        ),
      });

      final response = await dio.get(
        '/__mock__/health?test=1',
      );

      expect(response.statusCode, 200);
    });
  });
}
