
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/api_client_factory.dart';
import '../../core/network/mock/mock_api_scenario.dart';

final getIt = GetIt.instance;

void configureNetworkDependencies({
  GetIt? container,
  required bool useMock,
  String? baseUrl,
  Map<String, MockApiScenario> scenarios = const {},
}) {
  final locator = container ?? getIt;

  // Prevent accidental duplicate registrations.
  if (locator.isRegistered<Dio>()) {
    throw StateError(
      'Dio is already registered. '
          'Review existing network dependencies.',
    );
  }

  // Create and validate the selected API client.
  final dio = ApiClientFactory.create(
    useMock: useMock,
    baseUrl: baseUrl,
    scenarios: scenarios,
  );

  // Register a single shared Dio instance.
  locator.registerSingleton<Dio>(
    dio,
    dispose: (client) => client.close(force: true),
  );
}
