import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:todoapp/myTabBar.dart';
import 'package:todoapp/constants.dart';
import 'package:todoapp/notePage.dart';

import 'addPagePopUp.dart';
import 'myListView.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late String selectedValue = '';
  List<String> dropDownItemValue = [];
  List<NotePages> notePages = [];
  final List<NotePages> pages = [];

  void getListDataFromStorage() {
    dropDownItemValue.clear();
    notePages.clear();
    pages.clear();

    var keys = GetStorage().getKeys();
    for (var key in keys) {
      var pageString = GetStorage().read(key);

      List<String> pageList = pageString.split('-');

      if (pageList[0] == 'page') {
        NotePages page = new NotePages(
            type: pageList[0], pageName: pageList[1], createdTime: pageList[2]);

        pages.add(page);
      }
    }

    for (var i = 0; i < pages.length; i++) {
      notePages.add(pages[i]);
    }

    for (var i = 0; i < notePages.length; i++) {
      dropDownItemValue.add(notePages[i].pageName);
    }
    dropDownItemValue.add('');
    dropDownItemValue.add('Add Page');
    print(dropDownItemValue);
    // selected value must be contain at dropDownItemValue
    selectedValue = dropDownItemValue[0];
  }

  @override
  void initState() {
    super.initState();

    // GetStorage().erase();

    getListDataFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          MyTabBar(),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 3, top: 5),
                  child: Row(children: [
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
                          value: selectedValue,
                          isExpanded: true,
                          icon: Image.asset('assets/down-list-arrow.png'),
                          iconSize: 10,
                          elevation: 16,
                          onChanged: (newValue) {
                            //print(newValue);
                            setState(() {
                              selectedValue = newValue!;

                              if (selectedValue == 'Add Page') {
                                Navigator.of(context)
                                    .push(
                                      new MaterialPageRoute(
                                        //opaque: false,

                                        builder: (context) => AddPagePopUp(),
                                      ),
                                    )
                                    .then((value) => () {
                                          setState(() {
                                            print('asd');
                                          });
                                        });
                              }
                              getListDataFromStorage();
                            });
                          },
                          items: List.generate(
                            dropDownItemValue.length,
                            (index) => DropdownMenuItem(
                                child: Text('${dropDownItemValue[index]}'),
                                value: '${dropDownItemValue[index]}'),
                          ),
                        ),
                      ),
                    ),
                  ]),
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
