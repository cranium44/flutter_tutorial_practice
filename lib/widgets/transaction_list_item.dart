import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 4,
        shadowColor: Colors.limeAccent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 15, 5),
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    "\u20A6 ${transaction.ammount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.cyanAccent),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    transaction.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                ),
                Container(
                  child: Text(
                    DateFormat.yMMMEd().format(transaction.date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
