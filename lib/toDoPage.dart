import 'package:flutter/material.dart';
import 'package:todoapp/myTabBar.dart';
import 'package:todoapp/constants.dart';

import 'myListView.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  String dropdownValue = '1';

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
                  margin: EdgeInsets.only(left: 3, top: 5),
                  child: Row(
                    children: [
                      Ink(
                        width: 152,
                        height: 45,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            isExpanded: true,
                            icon: Image.asset('assets/down-list-arrow.png'),
                            iconSize: 10,
                            elevation: 16,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['1', '2', '3', '4']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyListView()
        ],
      ),
    ));
  }
}
