import 'package:flutter/material.dart';
import 'package:todoapp/note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key, required this.selectedPage}) : super(key: key);

  final String selectedPage;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  bool isBold = false;
  bool isItalic = false;

  Color boldColor = Colors.black;
  Color italicColor = Colors.black;

  final titleController = TextEditingController();
  final noteController = TextEditingController();

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
                                    child: TextField(
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
                        // Container(
                        //   margin: EdgeInsets.only(left: 10),
                        //   child: Row(
                        //     children: [
                        //       TextButton(
                        //         style: TextButton.styleFrom(
                        //           primary: Colors.black,
                        //         ),
                        //         child: Icon(
                        //           Icons.format_bold,
                        //           color: boldColor,
                        //         ),
                        //         onPressed: () {
                        //           isBold = !isBold;
                        //           setState(() {
                        //             if (isBold) {
                        //               boldColor = Colors.blueAccent;
                        //             } else {
                        //               boldColor = Colors.black;
                        //             }
                        //           });
                        //         },
                        //       ),
                        //       TextButton(
                        //         style: TextButton.styleFrom(
                        //           primary: Colors.black,
                        //         ),
                        //         child: Icon(
                        //           Icons.format_italic,
                        //           color: italicColor,
                        //         ),
                        //         onPressed: () {
                        //           isItalic = !isItalic;
                        //           setState(() {
                        //             if (isItalic) {
                        //               italicColor = Colors.blueAccent;
                        //             } else {
                        //               italicColor = Colors.black;
                        //             }
                        //           });
                        //         },
                        //       )
                        //     ],
                        //   ),
                        // ),
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
                            child: TextField(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: noteController,
                              showCursor: true,
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
                                      parentPage: widget.selectedPage,
                                      title: titleController.text,
                                      note: noteController.text,
                                      createdTime:
                                          DateTime.now().toIso8601String(),
                                    );

                                    print('''
                                      Parent Page : ${note.parentPage}
                                      Title : ${note.title}
                                      Note : ${note.note}
                                      Created Time : ${note.createdTime}
                                      ''');
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
