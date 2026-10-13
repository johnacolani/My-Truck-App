import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/core/error/exceptions.dart';

void main() {
  test('typed exception preserves diagnostic message', () {
    const exception = NetworkException('Connection unavailable');
    expect(exception.message, 'Connection unavailable');
    expect(exception.toString(), 'NetworkException: Connection unavailable');
  });
}
