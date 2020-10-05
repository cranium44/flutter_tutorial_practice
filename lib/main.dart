import 'package:flutter/material.dart';
import 'package:flutter_tutorial_practice/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Some app"),
        ),
        body: Home(),
      ),
    );
  }
}
