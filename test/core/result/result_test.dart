import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/core/error/failures.dart';
import 'package:flutter_design_system_lab/core/result/result.dart';

void main() {
  test('a successful result preserves its value', () {
    const Result<int> result = Success<int>(42);
    expect(result, isA<Success<int>>());
    expect((result as Success<int>).value, 42);
  });

  test('a failed result preserves a typed Failure', () {
    const Failure reason = ValidationFailure('Value required');
    const Result<int> result = FailureResult<int>(reason);
    expect(result, isA<FailureResult<int>>());
    final failure = (result as FailureResult<int>).reason;
    expect(failure, isA<ValidationFailure>());
    expect(failure.message, 'Value required');
  });
}
