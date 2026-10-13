import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system_lab/core/utils/input_validators.dart';

void main() {
  group('InputValidators', () {
    test('requiredText rejects null and whitespace', () {
      expect(
        InputValidators.requiredText(null, errorMessage: 'Required'),
        'Required',
      );
      expect(
        InputValidators.requiredText('   ', errorMessage: 'Required'),
        'Required',
      );
      expect(
        InputValidators.requiredText('Value', errorMessage: 'Required'),
        isNull,
      );
    });

    test('maxLength counts Unicode code points', () {
      expect(
        InputValidators.maxLength('ab', limit: 2, errorMessage: 'Too long'),
        isNull,
      );
      expect(
        InputValidators.maxLength('abc', limit: 2, errorMessage: 'Too long'),
        'Too long',
      );
      expect(
        InputValidators.maxLength('😀', limit: 1, errorMessage: 'Too long'),
        isNull,
      );
    });
  });
}
