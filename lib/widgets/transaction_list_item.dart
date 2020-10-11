import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 15, 5),
            padding: EdgeInsets.all(10),
            child: Text(
              "N " + transaction.ammount.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.cyanAccent),
                borderRadius: BorderRadius.circular(50)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  transaction.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
              ),
              Text(transaction.date.toString())
            ],
          )
        ],
      ),
    );
  }
}
