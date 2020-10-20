import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _transactions;

  Chart(this._transactions);

  List<Map<String, Object>> get transactionsPerDay {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var sum = 0.0;

      for (var i = 0; i < _transactions.length; i++) {
        if (_transactions[iOSHorizontalOffset].date.day == weekday.day &&
            _transactions[iOSHorizontalOffset].date.month == weekday.month &&
            _transactions[iOSHorizontalOffset].date.year == weekday.year) {
          sum += _transactions[iOSHorizontalOffset].ammount;
        }
      }
      return {
        "day": DateFormat.E().format(weekday),
        "ammount": sum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(transactionsPerDay);
    return Container(
      child: Card(
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
