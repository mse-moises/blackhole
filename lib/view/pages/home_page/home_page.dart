import 'package:blackhole/injection_container.dart';
import 'package:blackhole/mock/mock_list.dart';
import 'package:blackhole/view/components/transaction_tile.dart';
import 'package:blackhole/view/pages/create_transaction_page/create_transaction_page.dart';
import 'package:blackhole/view/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String route = "/";
  HomePage({Key? key}) : super(key: key);

  final HomePageBloc bloc = getIt.get<HomePageBloc>();

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
        floatingActionButton: const _FloatingActionButton(),
        body: const SafeArea(
          child: _HomeBody(),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoaded) {
          return FloatingActionButton(
            heroTag: 'FloatingActionButton',
            onPressed: () =>
                Navigator.pushNamed(context, CreateTransactionPage.route),
            child: const Icon(Icons.add),
          );
        }

        return Container();
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoaded) {
          final _transactionList = state.transactionList;

          return ListView.separated(
            itemBuilder: (_, index) {
              return TransactionTile(
                transactionModel: _transactionList[index],
              );
            },
            separatorBuilder: (_, __) {
              return const Divider();
            },
            itemCount: _transactionList.length,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
