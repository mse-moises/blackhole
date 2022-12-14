import 'package:blackhole/datasource/local_datasource.dart';
import 'package:blackhole/errors/failure.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:either_dart/either.dart';

abstract class TransactionRepositoryInterface{
  late final LocalDataSource dataSource;
  Future<Either<Failure, TransactionModel>> addTransaction(TransactionModel transactionModel);
  Future<Either<Failure, TransactionModel>> editTransaction(TransactionModel transactionModel);
  Future<Either<Failure, TransactionModel>> deleteTransaction(TransactionModel transactionModel);
  Future<Either<Failure, TransactionModel>> getTransaction(TransactionModel transactionModel);
  Future<Either<Failure, List<TransactionModel>>> requestAllTransactions();
}