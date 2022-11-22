import 'package:blackhole/view/pages/create_transaction_page/create_transaction_page.dart';
import 'package:blackhole/view/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'initial_configs.dart';
import 'injection_container.dart' as injectionContainer;

void main() async {
  await initialConfigs();
  await injectionContainer.init();
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
        HomePage.route: (context) => HomePage(),
        CreateTransactionPage.route: (context) => CreateTransactionPage(),
      },
    );
  }
}
