import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/models/note.dart';

class AddNotePage extends StatefulWidget {
  AddNotePage({Key? key, required this.selectedPage, this.title, this.note})
      : super(key: key);

  final String selectedPage;
  String? title = '';
  String? note = '';

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  bool isBold = false;
  bool isItalic = false;

  Color boldColor = Colors.black;
  Color italicColor = Colors.black;

  var titleController = TextEditingController();
  var noteController = TextEditingController();
  @override
  void initState() {
    super.initState();

    titleController.text = widget.title!;
    noteController.text = widget.note!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: SafeArea(
        child: Container(
            // alignment: Alignment.center,
            // color: Colors.amber,
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(
                  child: Ink(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                          //color: Colors.blueGrey,
                          child: Row(
                            children: [
                              Text('Title :'),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Ink(
                                  height: 30,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: (Border.all(
                                          color: Colors.black, width: 1)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Expanded(
                                    child: TextFormField(
                                      //initialValue: titleController.text,
                                      controller: titleController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text('Note :'),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              //initialValue: noteController.text,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: noteController,
                              showCursor: true,
                              scrollController: ScrollController(),
                            ),
                          ),
                        ),
                        Row(
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
                                  )),
                            )),
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
                                    Note note = new Note(
                                      type: 'note',
                                      parentPage: widget.selectedPage,
                                      title: titleController.text,
                                      note: noteController.text,
                                      createdTime:
                                          DateTime.now().toIso8601String(),
                                    );

                                    var random = Random();
                                    GetStorage().write(
                                        'note ${random.nextInt(999)}',
                                        '${note.type}-${note.parentPage}-${note.title}-${note.note}-${note.createdTime}');

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Okay',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  )),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
