import 'package:flutter/material.dart';
import 'package:todoapp/toDoPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: TodoPage(),
      ),
    );
  }
}
