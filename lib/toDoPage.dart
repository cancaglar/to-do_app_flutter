import 'package:flutter/material.dart';
import 'package:todoapp/myTabBar.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTabBar(),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Center(child: Text("Hello wWorld")),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
