import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';

import '../new_transaction.dart';
import '../user_transaction.dart';
import '../chart.dart';

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

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void beginAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }

  List<Transaction> get recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      title: Text("Transactions"),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => beginAddTransaction(context),
        ),
      ],
    );

    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        _appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.25,
                child: Chart(transactions),
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        _appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.75,
                child: Transactions(transactions, _deleteTransaction),
              ),
            ],
          ),
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
