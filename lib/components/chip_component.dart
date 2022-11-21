import 'package:flutter/material.dart';

class ChipComponent extends StatelessWidget {
  const ChipComponent({ Key? key, required this.label }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      //labelPadding: EdgeInsets.all(2.0),
      // avatar: CircleAvatar(
      //   backgroundColor: Colors.white70,
      //   child: Text(label[0].toUpperCase()),
      // ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      // backgroundColor: color,
      // elevation: 6.0,
      // shadowColor: Colors.grey[60],
      // padding: EdgeInsets.all(8.0),
    );
  }
}