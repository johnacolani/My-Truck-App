import '../error/failures.dart';

/// Explicit success/failure value with no dependency on a backend.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.reason);

  final AppFailure reason;
}
