import 'package:blackhole/injection_container.dart';
import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:blackhole/view/components/transaction_tile.dart';
import 'package:blackhole/view/pages/create_transaction_page/create_transaction_page.dart';
import 'package:blackhole/view/pages/home_page/bloc/home_page_bloc.dart';
import 'package:blackhole/view/pages/transaction_page/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String route = "/";
  HomePage({Key? key}) : super(key: key);

  final HomePageBloc bloc = getIt.get<HomePageBloc>();

  void openTransactionPage(
    BuildContext context,
    TransactionModel transactionModel,
  ) async {
    await Navigator.pushNamed(
      context,
      TransactionPage.route,
      arguments: transactionModel,
    );
    requestTransactionList();
  }

  void openCreateTransactionPage(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      CreateTransactionPage.route,
    );

    requestTransactionList();
  }

  void requestTransactionList() {
    bloc.add(HomePageRequestLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home"),
        ),
        floatingActionButton: _FloatingActionButton(
          openCreateTransactionPage: openCreateTransactionPage,
        ),
        body: SafeArea(
          child: _HomeBody(
            openTransactionPage: openTransactionPage,
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton(
      {Key? key, required this.openCreateTransactionPage})
      : super(key: key);

  final Function(BuildContext) openCreateTransactionPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoaded) {
          return FloatingActionButton(
            heroTag: 'FloatingActionButton',
            onPressed: () => openCreateTransactionPage(context),
            child: const Icon(Icons.add),
          );
        }

        return Container();
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
    required this.openTransactionPage,
  }) : super(key: key);

  final void Function(BuildContext, TransactionModel) openTransactionPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoaded) {
          final _transactionList = state.transactionList;

          return ListView.builder(
            itemBuilder: (_, index) {
              return TransactionTile(
                transactionModel: _transactionList[index],
                onTap: () =>
                    openTransactionPage(context, _transactionList[index]),
              );
            },
            itemCount: _transactionList.length,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
