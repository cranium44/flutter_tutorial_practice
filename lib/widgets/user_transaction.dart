import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';

import 'transaction_list_item.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactions;

  Transactions(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionItem(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}
