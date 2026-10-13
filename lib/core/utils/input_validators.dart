/// Generic input checks. Supply localized messages at the call site.
abstract final class InputValidators {
  static String? requiredText(
    String? value, {
    required String errorMessage,
  }) {
    if (value == null || value.trim().isEmpty) return errorMessage;
    return null;
  }

  static String? maxLength(
    String? value, {
    required int limit,
    required String errorMessage,
  }) {
    assert(limit >= 0, 'Limit must not be negative');
    if (value == null) return null;
    return value.runes.length > limit ? errorMessage : null;
  }
}
