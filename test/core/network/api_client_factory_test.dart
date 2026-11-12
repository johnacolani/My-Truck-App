import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/core/network/api_client_factory.dart';
import '../../../lib/core/network/mock/mock_api_interceptor.dart';
import '../../../lib/core/network/mock/mock_api_scenario.dart';

void main() {
  group('ApiClientFactory', () {
    test('creates Mock Dio with interceptor', () {
      final dio = ApiClientFactory.create(
        useMock: true,
        scenarios: {
          'GET /__mock__/health': MockApiScenario.success(),
        },
      );

      expect(
        dio.interceptors.whereType<MockApiInterceptor>(),
        hasLength(1),
      );
    });

    test('returns a configured mock response', () async {
      final dio = ApiClientFactory.create(
        useMock: true,
        scenarios: {
          'GET /__mock__/health': MockApiScenario.success(
            body: {'status': 'success'},
          ),
        },
      );

      final response = await dio.get(
        '/__mock__/health',
      );

      expect(response.statusCode, 200);
      expect(response.data['status'], 'success');
    });

    test('creates Real Dio without mock interceptor', () {
      final dio = ApiClientFactory.create(
        useMock: false,
        baseUrl: 'https://api.example.com',
      );

      expect(
        dio.interceptors.whereType<MockApiInterceptor>(),
        isEmpty,
      );

      expect(
        dio.options.baseUrl,
        'https://api.example.com',
      );
    });

    test('rejects missing Real API URL', () {
      expect(
        () => ApiClientFactory.create(
          useMock: false,
        ),
        throwsArgumentError,
      );
    });

    test('rejects Mock mode outside Debug', () {
      expect(
        () => MockApiSafetyPolicy.ensureAllowed(
          useMock: true,
          isDebugBuild: false,
        ),
        throwsStateError,
      );
    });

    test('allows Real mode outside Debug', () {
      expect(
        () => MockApiSafetyPolicy.ensureAllowed(
          useMock: false,
          isDebugBuild: false,
        ),
        returnsNormally,
      );
    });

    test('blocks unregistered mock requests', () async {
      final dio = ApiClientFactory.create(
        useMock: true,
      );

      await expectLater(
        dio.get('/unregistered'),
        throwsA(
          isA<DioException>().having(
            (error) => error.response?.statusCode,
            'statusCode',
            404,
          ),
        ),
      );
    });
  });
}
