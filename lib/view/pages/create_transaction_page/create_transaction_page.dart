import 'package:blackhole/injection_container.dart';
import 'package:blackhole/view/pages/create_transaction_page/bloc/create_transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTransactionPage extends StatelessWidget {
  static const String route = "/new-transaction";
  CreateTransactionPage({Key? key}) : super(key: key);

  final CreateTransactionBloc bloc = getIt.get<CreateTransactionBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("New transaction"),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}