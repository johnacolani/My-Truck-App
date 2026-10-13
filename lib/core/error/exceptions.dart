/// Technical exceptions raised at an application integration boundary.
abstract class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

final class NetworkException extends AppException {
  const NetworkException(super.message);
}

final class ValidationException extends AppException {
  const ValidationException(super.message);
}

final class UnexpectedException extends AppException {
  const UnexpectedException(super.message);
}
