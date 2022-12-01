import 'package:flutter/material.dart';

class ValidationText extends StatelessWidget {
  const ValidationText({Key? key, required this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (_) {
          if (title == null) return Container();
          return Text(
            title!,
            style: const TextStyle(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
