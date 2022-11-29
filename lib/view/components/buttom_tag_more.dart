import 'package:blackhole/const/const_theme.dart';
import 'package:flutter/material.dart';

class ButtonTagMore extends StatelessWidget {
  ButtonTagMore({
    Key? key,
  }) : super(key: key);

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
            borderRadius: BorderRadius.circular(
              ThemeConstant.borderRadiusButtonTag,
            ),
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
