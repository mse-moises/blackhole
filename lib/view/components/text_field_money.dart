import 'package:blackhole/const/const_theme.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class TextFieldMoney extends StatelessWidget {
  const TextFieldMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "R\$",
          style: CONST_MONEY_SIMPLE_TEXT,
        ), //TODO: internacionalizate
        // TextField(
        //   inputFormatters: [
        //     CurrencyTextInputFormatter(symbol: ""),
        //   ],
        //   keyboardType: TextInputType.number,
        //   decoration: CONST_MONEY_SIMPLE_DECORATION,
        // ),
        Expanded(
          child: TextField(
            inputFormatters: [
              CurrencyTextInputFormatter(symbol: ""),
            ],
            keyboardType: TextInputType.number,
            decoration: CONST_MONEY_SIMPLE_DECORATION,
          ),
        ),
      ],
    );
  }
}
