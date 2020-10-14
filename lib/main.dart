import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/widgets/new_transaction.dart';
import 'models/transaction.dart';
import 'widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "Biscuits", ammount: 150.00, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Offering", ammount: 500.00, date: DateTime.now()),
    Transaction(
        id: "t3", title: "Jumper shorts", ammount: 750.00, date: DateTime.now())
  ];

  addTransaction(Transaction tr) {
    setState(() {
      transactions.add(tr);
    });
  }

  beginAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transactions"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => beginAddTransaction(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => beginAddTransaction(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
