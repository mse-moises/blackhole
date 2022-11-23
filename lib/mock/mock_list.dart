import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/models/transaction_model.dart';

class MockList {
  static final tagList = <TagModel>[
    TagModel(label: "Shopping"),
    TagModel(label: "Food"),
    TagModel(label: "Gym"),
    TagModel(label: "House"),
    TagModel(label: "Shopping"),
    TagModel(label: "Food"),
    TagModel(label: "Gym"),
    TagModel(label: "House"),
    TagModel(label: "Gym"),
    TagModel(label: "House"),
  ];

  static final transactionList = <TransactionModel>[
    TransactionModel(
      value: 100.0,
      observation: "assalto",
      tags: tagList,
      primaryTag: tagList[2],
    ),
    TransactionModel(
      value: 111.0,
      observation: "epsus laterous",
      tags: [tagList[3]],
      primaryTag: tagList[3],
    ),
    TransactionModel(
      value: 100.3,
      observation: "esse foi comida",
      tags: tagList,
      primaryTag: tagList[0],
    ),
    TransactionModel(
      value: 10.0,
      observation: "gasolina",
      tags: [
        tagList[1],
        tagList[3],
      ],
      primaryTag: tagList[1],
    ),
  ];
}
