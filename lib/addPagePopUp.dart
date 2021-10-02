import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:todoapp/models/notePage.dart';

class AddPagePopUp extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      border: (Border.all(color: Colors.black, width: 1)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5, top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Title:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      //margin: EdgeInsets.all(5),
                                      child: Ink(
                                        height: 30,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: (Border.all(
                                                color: Colors.black, width: 1)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Expanded(
                                          child: TextField(
                                            controller: myController,
                                            decoration: InputDecoration(
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Ink(
                            decoration: BoxDecoration(
                              border:
                                  (Border.all(color: Colors.black, width: 1)),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Ink(
                              decoration: BoxDecoration(
                                border:
                                    (Border.all(color: Colors.black, width: 1)),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    NotePages page = NotePages(
                                        type: 'page',
                                        pageName: myController.text,
                                        createdTime:
                                            DateTime.now().toIso8601String());

                                    //_save(pageList, 'page');
                                    var random = Random();
                                    GetStorage().write(
                                        'page ${random.nextInt(999)}',
                                        '${page.type}-${page.pageName}-${page.createdTime}');

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Okay',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
