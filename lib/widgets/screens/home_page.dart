import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';

import '../new_transaction.dart';
import '../user_transaction.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "Biscuits", ammount: 150.00, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Offering", ammount: 500.00, date: DateTime.now()),
    Transaction(
        id: "t3", title: "Jumper shorts", ammount: 750.00, date: DateTime.now())
  ];

  _addTransaction(Transaction tr) {
    setState(() {
      transactions.add(tr);
    });
  }

  void beginAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            
          },
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => beginAddTransaction(context),
          ),
        ],
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
            Transactions(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => beginAddTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
