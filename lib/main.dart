import 'package:flutter/material.dart';
import 'package:todoapp/toDoPage.dart';
import 'package:todoapp/constants.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: APP_DEFAULT_COLOR,
      home: Scaffold(
        backgroundColor: APP_DEFAULT_COLOR,
        body: TodoPage(),
      ),
    );
  }
}
