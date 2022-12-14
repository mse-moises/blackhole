import 'package:blackhole/models/transaction_model.dart';

abstract class LocalDataSource{
  Future<TransactionModel> addTransaction(TransactionModel transactionModel);
  Future<TransactionModel> deleteTransaction(TransactionModel transactionModel);
  Future<TransactionModel> editTransaction(TransactionModel transactionModel);
  Future<List<TransactionModel>> requestAllTransactions();
}

// class LocalDataSourceImplementation implements LocalDataSource{

//   @override
//   Future<List<TransactionModel>> requestAllTransactions() {
//     // TODO: implement requestAllTransactions
//     throw UnimplementedError();
//   }

//   @override
//   Future<TransactionModel> addTransaction(TransactionModel transactionModel) {
//     // TODO: implement addTransaction
//     throw UnimplementedError();
//   }

//   @override
//   Future<TransactionModel> deleteTransaction(TransactionModel transactionModel) {
//     // TODO: implement deleteTransaction
//     throw UnimplementedError();
//   }

//   @override
//   Future<TransactionModel> editTransaction(TransactionModel transactionModel) {
//     // TODO: implement editTransaction
//     throw UnimplementedError();
//   }

// }