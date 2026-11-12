
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../lib/app/di/app_dependencies.dart';
import '../../../lib/core/network/mock/mock_api_interceptor.dart';
import '../../../lib/core/network/mock/mock_api_scenario.dart';

void main() {
  late GetIt locator;

  setUp(() {
    locator = GetIt.asNewInstance();
  });

  tearDown(() async {
    await locator.reset();
  });

  group('Network Dependency Injection', () {
    test('registers Mock Dio', () {
      configureNetworkDependencies(
        container: locator,
        useMock: true,
      );

      expect(locator.isRegistered<Dio>(), true);

      final dio = locator<Dio>();

      expect(
        dio.interceptors.whereType<MockApiInterceptor>(),
        hasLength(1),
      );
    });

    test('returns a Mock API response', () async {
      configureNetworkDependencies(
        container: locator,
        useMock: true,
        scenarios: {
          'GET /__mock__/health':
          MockApiScenario.success(
            body: {'status': 'success'},
          ),
        },
      );

      final response = await locator<Dio>().get(
        '/__mock__/health',
      );

      expect(response.statusCode, 200);
      expect(response.data['status'], 'success');
    });

    test('registers Real Dio without Mock', () {
      configureNetworkDependencies(
        container: locator,
        useMock: false,
        baseUrl: 'https://api.example.com',
      );

      final dio = locator<Dio>();

      expect(
        dio.interceptors.whereType<MockApiInterceptor>(),
        isEmpty,
      );
    });

    test('prevents duplicate registration', () {
      configureNetworkDependencies(
        container: locator,
        useMock: true,
      );

      expect(
            () => configureNetworkDependencies(
          container: locator,
          useMock: true,
        ),
        throwsStateError,
      );
    });

    test('rejects missing Real API URL', () {
      expect(
            () => configureNetworkDependencies(
          container: locator,
          useMock: false,
        ),
        throwsArgumentError,
      );

      expect(locator.isRegistered<Dio>(), false);
    });
  });
}
