import 'package:blackhole/const/const_theme.dart';
import 'package:blackhole/models/tag_model.dart';
import 'package:blackhole/models/transaction_model.dart';
import 'package:blackhole/view/components/buttom_tag_more.dart';
import 'package:blackhole/view/components/button_tag_component.dart';
import 'package:blackhole/view/components/tag_component.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.transactionModel,
    this.onTap,
  }) : super(key: key);

  final TransactionModel transactionModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: ThemeConstant.thinBorderWidth,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(Icons.attach_money),
        title: Text(transactionModel.value.toString()),
        subtitle: Text(transactionModel.observation ?? ""),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (transactionModel.tags.length > 1) ...[
              ButtonTagMore(),
              const SizedBox(
                width: ThemeConstant.smallSpace,
              ),
            ],
            TagComponent(label: transactionModel.primaryTag.label),
          ],
        ),
      ),
    );
  }
}


