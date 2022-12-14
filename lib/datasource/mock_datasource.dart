import 'package:blackhole/datasource/local_datasource.dart';
import 'package:blackhole/errors/exeptions.dart';
import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/transaction_model.dart';

class MockDataSource implements LocalDataSource {
  final transactionList = <TransactionModel>[...MockList.transactionList];

  @override
  Future<TransactionModel> addTransaction(TransactionModel transactionModel) {
    if (!transactionList.contains(transactionModel)) {
      transactionList.add(transactionModel);
    }

    return Future.value(transactionModel);
  }

  @override
  Future<List<TransactionModel>> requestAllTransactions() async {
    await Future.delayed(const Duration(seconds: 1));
    return transactionList;
  }

  @override
  Future<TransactionModel> deleteTransaction(
      TransactionModel transactionModel) {
    if (!transactionList.contains(transactionModel)) {
      throw TransactionDoesNotExistException();
    }

    transactionList.remove(transactionModel);
    return Future.value(transactionModel);
  }

  @override
  Future<TransactionModel> editTransaction(TransactionModel transactionModel) {
    // TODO: implement editTransaction
    throw UnimplementedError();
  }
}
