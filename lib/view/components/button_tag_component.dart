import 'package:blackhole/const/const_theme.dart';
import 'package:flutter/material.dart';

class ButtonTagComponent extends StatelessWidget {
  const ButtonTagComponent({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final void Function()? onTap; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(MEDIUM_SPACE),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(CONST_BORDER_RADIUS_BUTTON_TAG),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
