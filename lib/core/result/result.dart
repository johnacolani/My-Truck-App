import '../error/failures.dart';

/// Explicit success/failure value with no dependency on a backend.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

/// Named differently from the core Failure base to avoid a name collision.
final class FailureResult<T> extends Result<T> {
  const FailureResult(this.reason);

  final Failure reason;
}
