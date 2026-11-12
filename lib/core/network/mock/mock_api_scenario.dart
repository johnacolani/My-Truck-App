enum MockFailureType {
  none,
  timeout,
  connectionError,
}

class MockApiScenario {
  final int statusCode;
  final Object? body;
  final Duration delay;
  final MockFailureType failureType;

  const MockApiScenario({
    this.statusCode = 200,
    this.body,
    this.delay = Duration.zero,
    this.failureType = MockFailureType.none,
  }) : assert(statusCode >= 100 && statusCode <= 599);

  factory MockApiScenario.success({
    Object? body,
    Duration delay = Duration.zero,
  }) {
    return MockApiScenario(statusCode: 200, body: body, delay: delay);
  }

  factory MockApiScenario.httpError({
    required int statusCode,
    Object? body,
  }) {
    return MockApiScenario(statusCode: statusCode, body: body);
  }

  factory MockApiScenario.timeout() {
    return const MockApiScenario(
      failureType: MockFailureType.timeout,
    );
  }
  factory MockApiScenario.connectionError() {
    return const MockApiScenario(
      failureType: MockFailureType.connectionError,
    );
  }
}
