import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';
import 'package:intl/intl.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTx;

  Transactions(this.transactions, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        height: constraints.maxHeight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text("No transactions added yet"),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child:
                                Text("\u20A6 ${transactions[index].ammount}"),
                          ),
                        ),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                        DateFormat.yMMMEd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      trailing: MediaQuery.of(context).size.width > 450
                          ? FlatButton.icon(
                              onPressed: () {
                                _deleteTx(transactions[index].id);
                              },
                              icon: Icon(Icons.delete),
                              label: Text("Delete"),
                              textColor: Theme.of(context).errorColor,
                            )
                          : IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteTx(transactions[index].id);
                              },
                              color: Theme.of(context).errorColor,
                            ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      );
    });
  }
}
