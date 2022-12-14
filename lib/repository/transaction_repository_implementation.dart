import 'package:blackhole/models/transaction_model.dart';
import 'package:blackhole/errors/failure.dart';
import 'package:blackhole/datasource/local_datasource.dart';
import 'package:blackhole/repository/transaction_repository_interface.dart';
import 'package:either_dart/src/either.dart';

class TransactionRepositoryImplementation
    implements TransactionRepositoryInterface {
  @override
  LocalDataSource dataSource;

  TransactionRepositoryImplementation({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, TransactionModel>> addTransaction(
      TransactionModel transactionModel) async {
    try {
      final response = await dataSource.addTransaction(transactionModel);
      return Future.value(Right(response));
    } catch (e) {
      return Left(MockFailure());
    }
  }

  @override
  Future<Either<Failure, List<TransactionModel>>>
      requestAllTransactions() async {
    try {
      final response = await dataSource.requestAllTransactions();
      return Future.value(Right(response));
    } catch (e) {
      return Left(MockFailure());
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> deleteTransaction(
      TransactionModel transactionModel) async {
    try {
      final response = await dataSource.deleteTransaction(transactionModel);
      return Future.value(Right(response));
    } catch (e) {
      return Left(MockFailure());
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> editTransaction(
      TransactionModel transactionModel) {
    // TODO: implement editTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TransactionModel>> getTransaction(
      TransactionModel transactionModel) {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }
}
