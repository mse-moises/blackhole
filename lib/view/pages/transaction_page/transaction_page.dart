import 'package:blackhole/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  static const String route = "/transaction";
  const TransactionPage({Key? key, required this.transactionModel}) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Text(transactionModel.value.toString()),),
    );
  }
}
