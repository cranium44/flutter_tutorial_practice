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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text("No transactions added yet"),
                SizedBox(height: 15,),
                Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transactions[index]);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
