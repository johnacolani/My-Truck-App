import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/core/network/mock/mock_api_scenario.dart';

void main() {
  group('MockApiScenario', () {
    test('returns successful scenario', () {
      final scenario = MockApiScenario.success(
        body: {'status': 'success'},
      );

      expect(scenario.statusCode, 200);
      expect(scenario.failureType, MockFailureType.none);
      expect(scenario.body, {'status': 'success'});
    });

    test('supports HTTP errors', () {
      final scenario = MockApiScenario.httpError(
        statusCode: 401,
        body: {'message': 'Unauthorized'},
      );

      expect(scenario.statusCode, 401);
      expect(scenario.body, {
        'message': 'Unauthorized',
      });
    });

    test('supports network delay configuration', () {
      final scenario = MockApiScenario.success(
        delay: const Duration(seconds: 2),
      );

      expect(
        scenario.delay,
        const Duration(seconds: 2),
      );
    });

    test('supports timeout configuration', () {
      final scenario = MockApiScenario.timeout();

      expect(
        scenario.failureType,
        MockFailureType.timeout,
      );
    });

    test('supports connection error configuration', () {
      final scenario = MockApiScenario.connectionError();

      expect(
        scenario.failureType,
        MockFailureType.connectionError,
      );
    });
  });
}
