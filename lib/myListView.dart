import 'package:flutter/material.dart';
import 'package:todoapp/sharedPrefs.dart';

import 'constants.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}
//  THIS PAGE IS FOR NOTE LISTING

class _MyListViewState extends State<MyListView> {
  bool isListEmpty = true;
  SharedPrefs prefs = SharedPrefs();
  @override
  void initState() {
    super.initState();

    // prefs.loadAllPages().getPages().isEmpty
    //     ? isListEmpty = true
    //     : isListEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: emptyContainer(isListEmpty),
    );
  }

  Container emptyContainer(bool isListEmpty) {
    if (isListEmpty == true) {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        color: APP_DEFAULT_COLOR,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text('Empty.'),
            ),
          ],
        ),
      );
    } else {
      return containerList();
    }
  }
}

Container containerList() {
  return Container(
    child: Text('List is not empty'),
  );
}
