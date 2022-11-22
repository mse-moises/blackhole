import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/models/transaction_model.dart';

class MockList {
  static final chipList = <TagModel>[
    TagModel(label: "Shopping"),
    TagModel(label: "Food"),
    TagModel(label: "Gym"),
    TagModel(label: "House"),
  ];

  static final transactionList = <TransactionModel>[
    TransactionModel(
      value: 100.0,
      observation: "assalto",
      tags: chipList,
      primaryTag: chipList[2],
    ),
    TransactionModel(
      value: 111.0,
      observation: "epsus laterous",
      tags: [chipList[3]],
      primaryTag: chipList[3],
    ),
    TransactionModel(
      value: 100.3,
      observation: "esse foi comida",
      tags: chipList,
      primaryTag: chipList[0],
    ),
    TransactionModel(
      value: 10.0,
      observation: "gasolina",
      tags: [
        chipList[1],
        chipList[3],
      ],
      primaryTag: chipList[1],
    ),
  ];
}
