import 'package:blackhole/const/const_theme.dart';
import 'package:flutter/material.dart';

class ButtonTagComponent extends StatelessWidget {
  ButtonTagComponent({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 30,
        width: 35,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(CONST_BORDER_RADIUS_BUTTON_CHIP),
          ),
          child: const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
