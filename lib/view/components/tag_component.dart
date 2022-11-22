import 'package:flutter/material.dart';

class TagComponent extends StatelessWidget {
  const TagComponent({ Key? key, required this.label }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}