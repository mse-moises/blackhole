abstract class Failure {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DeviceFailure extends Failure {}

class MockFailure extends Failure {}

class TransactionDoesNotExistFailure extends Failure {}
