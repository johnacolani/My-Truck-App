import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/core/error/failures.dart';
import 'package:flutter_design_system_lab/core/result/result.dart';

void main() {
  test('a successful result preserves its value', () {
    const Result<int> result = Success<int>(42);
    expect(result, isA<Success<int>>());
    expect((result as Success<int>).value, 42);
  });

  test('a failed result preserves a typed failure', () {
    const Result<int> result =
        Failure<int>(ValidationFailure('Value required'));
    expect(result, isA<Failure<int>>());
    final reason = (result as Failure<int>).reason;
    expect(reason, isA<ValidationFailure>());
    expect(reason.message, 'Value required');
  });
}
