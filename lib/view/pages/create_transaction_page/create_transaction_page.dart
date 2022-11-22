import 'package:flutter/material.dart';

class CreateTransactionPage extends StatelessWidget {
  static const String route = "/new-transaction";
  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("New transaction"),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
