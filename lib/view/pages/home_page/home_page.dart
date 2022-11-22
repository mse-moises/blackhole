import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/view/components/transaction_tile.dart';
import 'package:blackhole/view/pages/create_transaction_page/create_transaction_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, CreateTransactionPage.route),
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: _HomeBody(),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return TransactionTile(
          transactionModel: MockList.transactionList[index],
        );
      },
      separatorBuilder: (_, __) {
        return const Divider();
      },
      itemCount: MockList.transactionList.length,
    );
  }
}
