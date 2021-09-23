import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/addPagePopUp.dart';
import 'package:todoapp/toDoPage.dart';
import 'package:todoapp/constants.dart';

void main() async {
  await GetStorage.init();
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
      initialRoute: '/',
      routes: {
        '/todopage': (context) => TodoPage(),
        '/addpage': (context) => AddPagePopUp()
      },
    );
  }
}
