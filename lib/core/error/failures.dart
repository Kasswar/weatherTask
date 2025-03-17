abstract class Failure {
  final String message;

  const Failure(this.message);
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
