import 'package:blackhole/components/transaction_tile.dart';
import 'package:blackhole/const/mock_const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            TransactionTile(
              name: NAME_MOCK,
              observation: OBSERVATION_MOCK,
              value: VALUE_MOCK,

              //numberForMock
              numberOfTags: 1,
            ),
            TransactionTile(
              name: NAME_MOCK,
              observation: OBSERVATION_MOCK,
              value: VALUE_MOCK,

              //numberForMock
              numberOfTags: 2,
            ),
            TransactionTile(
              name: NAME_MOCK,
              observation: OBSERVATION_MOCK,
              value: VALUE_MOCK,

              //numberForMock
              numberOfTags: 1,
            ),
          ],
        ),
      ),
    );
  }
}
