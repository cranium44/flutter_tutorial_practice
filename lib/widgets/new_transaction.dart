import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  DateTime _date;

  void _submitData() {
    final titleEntered = _titleController.text;
    final amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0) {
      return;
    }

    widget.addTransaction(Transaction(
      id: DateTime.now().toString(),
      title: titleEntered,
      ammount: amountEntered,
      date: _date == null ? DateTime.now() : _date,
    ));

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
      if (value == null) return;
      _date = value;
      });
    });
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
            onSubmitted: (value) => _submitData(),
            decoration: InputDecoration(
                hintText: "Enter expense title", labelText: "Title"),
          ),
          TextField(
            controller: _amountController,
            onSubmitted: (value) => _submitData(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Enter ammount", labelText: "Ammount"),
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_date == null ? "No date selected": "Picked date: ${DateFormat.yMMMd().format(_date)}"),
                FlatButton(
                  onPressed: () => _presentDatePicker(),
                  child: Text(
                    "Choose Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: _submitData,
            child: Text("Add transaction"),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
          )
        ],
      ),
    );
  }
}
