import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';
import 'package:flutter_tutorial_practice/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _transactions;

  Chart(this._transactions);

  List<Map<String, Object>> get transactionsPerDay {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var sum = 0.0;

      for (var i = 0; i < _transactions.length; i++) {
        if (_transactions[i].date.day == weekday.day &&
            _transactions[i].date.month == weekday.month &&
            _transactions[i].date.year == weekday.year) {
          sum += _transactions[i].ammount;
        }
      }
      return {
        "day": DateFormat.E().format(weekday).substring(0, 1),
        "ammount": sum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return transactionsPerDay.fold(0.0, (sum, tx) {
      return sum + tx["ammount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(transactionsPerDay);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: transactionsPerDay.map((tx) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tx["day"],
                  spendingAmount: tx["ammount"],
                  spendingPctOfTotal: maxSpending == 0.0
                      ? 0.0
                      : (tx["ammount"] as double) / maxSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
