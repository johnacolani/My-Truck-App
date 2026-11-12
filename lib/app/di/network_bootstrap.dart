
import 'package:get_it/get_it.dart';

import '../../core/network/mock/mock_api_scenario.dart';
import 'app_dependencies.dart';

void initializeNetworkDependencies({
  GetIt? container,
  required bool useMock,
  String? baseUrl,
  Map<String, MockApiScenario> scenarios = const {},
}) {
  configureNetworkDependencies(
    container: container,
    useMock: useMock,
    baseUrl: baseUrl,
    scenarios: scenarios,
  );
}
