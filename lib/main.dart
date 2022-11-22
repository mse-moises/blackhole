import 'package:blackhole/view/pages/create_transaction_page/create_transaction_page.dart';
import 'package:blackhole/view/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlackHole - Wallet Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        HomePage.route: (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        CreateTransactionPage.route: (context) => const CreateTransactionPage(),
      },
    );
  }
}
