import 'package:blackhole/const/const_theme.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class TextFieldMoney extends StatelessWidget {
  const TextFieldMoney({
    Key? key,
    this.onChange,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "R\$",
          style: ThemeConstant.moneySimpleText,
        ), //TODO: internacionalizate
        SizedBox(
          width: ThemeConstant.smallSpace,
        ),
        Expanded(
          child: TextFormField(
            validator: validator,
            style: ThemeConstant.moneySimpleText,
            onChanged: onChange,
            controller: controller,
            inputFormatters: [
              CurrencyTextInputFormatter(symbol: ""),
            ],
            keyboardType: TextInputType.number,
            //decoration: ThemeConstant.moneySimpleDecoration,
          ),
        ),
      ],
    );
  }
}
