import 'package:flutter/material.dart';

import 'constants.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EmptyContainer(true),
    );
  }

  Container EmptyContainer(bool isListEmpty) {
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
      return ContainerList();
    }
  }
}

Container ContainerList() {
  return Container(
    child: Text('List is not empty'),
  );
}
