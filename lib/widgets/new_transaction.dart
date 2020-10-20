import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    final titleEntered = _titleController.text;
    final amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0) {
      return;
    }

    widget.addTransaction(Transaction(
      id: DateTime.now().toString(),
      title: titleEntered,
      ammount: amountEntered,
      date: DateTime.now(),
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            onSubmitted: (value) => submitData(),
            decoration: InputDecoration(
                hintText: "Enter expense title", labelText: "Title"),
          ),
          TextField(
            controller: _amountController,
            onSubmitted: (value) => submitData(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Enter ammount", labelText: "Ammount"),
          ),
          FlatButton(
            onPressed: submitData,
            child: Text("Add transaction"),
            textColor: Colors.purple,
          )
        ],
      ),
    );
  }
}
