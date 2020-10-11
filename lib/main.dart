import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';
import 'package:flutter_tutorial_practice/widgets/transaction_list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "Biscuits", ammount: 150.00, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Offering", ammount: 500.00, date: DateTime.now()),
    Transaction(
        id: "t3", title: "Jumper shorts", ammount: 750.00, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transactions"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Text("chart"),
                color: Colors.blueAccent,
                shadowColor: Colors.black,
              ),
              Column(
                children: transactions.map((trans) {
                  return TransactionItem(trans);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
