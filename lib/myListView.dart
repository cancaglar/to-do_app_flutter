import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/addNotePage.dart';
import 'constants.dart';

class MyListView extends StatefulWidget {
  MyListView({Key? key, required this.parentPage, required this.noteList})
      : super(key: key);

  final String parentPage;
  List<NoteWidget> noteList = [];

  @override
  _MyListViewState createState() => _MyListViewState();
}
//  THIS PAGE IS FOR NOTE LISTING

class _MyListViewState extends State<MyListView> {
  bool isListEmpty = false;
  String parentPage = '';

  List<NoteWidget> notes = <NoteWidget>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      parentPage = widget.parentPage;
      notes = widget.noteList;
    });

    //notes.isEmpty == true ? isListEmpty = true : isListEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return emptyContainer(isListEmpty, notes);
  }

  Container emptyContainer(bool isListEmpty, List<NoteWidget> list) {
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
      return containerList(list, parentPage);
    }
  }
}

Container containerList(List<NoteWidget> list, String parentPage) {
  // LIST CONTAINER
  return Container(
      //padding: EdgeInsets.only(left: 3, right: 3, bottom: 5),
      child: Expanded(
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: ((context, index) {
        return list[index];
      }),
    ),
  )

      // NoteWidget(
      //     name: 'as',
      //     parentPage: parentPage,
      //     title: 'title',
      //     note:
      //         ' is simply dummy text of the printing and typesettingindustry.is simply dummy text odf the printing and typesettingindustry. is simply dummy text ofas the printing and typesettingindustry.fsdfdsfsdfLorem Ipsum has also the leap into electronictypesetting, remaining essentially unchanged. '),
      // NoteWidget(
      //     name: 'name',
      //     parentPage: parentPage,
      //     title: 'title',
      //     note:
      //         ' is simply dummy text of the printing and typesettingindustry.is simply dummy text odf the printing and typesettingindustry. is simply dummy text ofas the printing and typesettingindustry.fsdfdsfsdfLorem Ipsum has also the leap into electronictypesetting, remaining essentially unchanged. '),

      );
}

class NoteWidget extends StatefulWidget {
  String name;
  String title;
  String note;
  String parentPage;

  NoteWidget({
    required this.title,
    required this.note,
    required this.parentPage,
    required this.name,
  });
  @override
  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  bool isChecked = false;
  Color tagColor = APP_DEFAULT_COLOR;

  Future<dynamic> createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choose a tag'),
            actions: [
              MaterialButton(
                child: Text('Black'),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop(Colors.black);
                  });
                },
              ),
              MaterialButton(
                child: Text('White'),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop(Colors.white);
                  });
                },
              ),
              MaterialButton(
                child: Text('Yellow'),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop(Colors.yellow);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      height: 180,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RawMaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotePage(
                  selectedPage: widget.parentPage,
                  title: widget.title,
                  note: widget.note,
                  noteKey: widget.name,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 30,
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      child: Ink(
                        //color: tagColor,
                        decoration: BoxDecoration(
                          color: tagColor,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(primary: Colors.black),
                          child: Image.asset(
                            'assets/tag-button.png',
                          ),
                          onPressed: () {
                            setState(() {
                              createAlertDialog(context).then((value) {
                                tagColor = value;
                              });
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                                    child: Text(widget.title,
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 20)))),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Ink(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(50)),
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  shape: CircleBorder(),
                                  child: Row(
                                    children: [
                                      if (isChecked)
                                        Expanded(
                                          child: Image.asset(
                                              'assets/check-mark.png'),
                                        )
                                      else if (!isChecked)
                                        SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.note,
                  maxLines: 3,
                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
                ),
              ),
              if (widget.note.length >= 154) // almost 3 MaxLine
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
