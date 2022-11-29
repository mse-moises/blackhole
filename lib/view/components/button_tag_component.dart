import 'package:blackhole/const/const_theme.dart';
import 'package:flutter/material.dart';

class ButtonTagComponent extends StatelessWidget {
  const ButtonTagComponent({
    Key? key,
    required this.label,
    required this.onTap,
    required this.isFirstTag,
    required this.toAdd,
  }) : super(key: key);

  final String label;
  final void Function()? onTap;
  final bool isFirstTag;
  final bool toAdd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          ThemeConstant.mediumSpace,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(
            ThemeConstant.borderRadiusButtonTag,
          ),
          border: isFirstTag ? Border.all(color: Colors.indigo) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(
                  ThemeConstant.borderRadiusButtonTag,
                ),
              ),
              child: Builder(builder: (_) {
                IconData icon = toAdd ? Icons.add : Icons.remove;
                return Icon(
                  icon,
                  color: Colors.grey[500],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
