import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var _names = ["john", "james", "peter"];
  var _nameIndex = 0;

  void incrementIndex() {
    setState(() {
      _nameIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex Entries"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index)  {
          return Text("well");
        },
        )
    );
  }
}
