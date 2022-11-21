import 'package:blackhole/components/chip_component.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.name,
    required this.observation,
    required this.value,

    //formock
    required this.numberOfTags
  }) : super(key: key);

  final String name;
  final double value;
  final String observation;

  //formock
  final int numberOfTags;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.attach_money),
      title: Text(value.toString()),
      subtitle: Text(name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           if(numberOfTags > 1 ) ...[
            const ChipComponent(label: "..."),
          ],

          const ChipComponent(label: "tag"),
        ],
      ),
    );
  }
}
