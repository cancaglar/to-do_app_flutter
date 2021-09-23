import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/note.dart';
import 'package:todoapp/notePage.dart';

class SharedPrefs {
  loadData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String json = prefs.getString(key)!;
    print('fkjsdbfksdbfkjsdfbkd');
    if (json == null) {
      print('No data in SharedPreference');
    } else {
      Map<String, dynamic> map = jsonDecode(json);
      print('map $map');

      final page = NotePages.fromJson(map);
      return page; // need to be convert to object

    }

    saveData(String key, object) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String json = jsonEncode(object);
      print('Generated json $json');

      prefs.setString(key, json);
    }

    clearData() async {}
  }
}
/* old code not working (i guess)
int counter = 0;

  save(String key, list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('counter')) {
      prefs.setInt('counter', counter); // set the counter
    } else {
      counter = prefs.getInt('counter')!;
    }

    if (!prefs.containsKey(key + counter.toString())) {
      prefs.setStringList(key + counter.toString(), list);

      prefs.setInt('counter', counter + 1);
    }
  }

  Future<List<NotePages>> loadAllPages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<NotePages> pages = [];

    final keys = prefs.getKeys();
    var shared;

    for (String key in keys) {
      shared = prefs.getStringList(key);

      if (shared[0] == 'page') {
        NotePages page = NotePages(
            type: shared[0], pageName: shared[1], createdTime: shared[2]);

        pages.add(page);
      } else {
        continue;
      }
    }

    return pages;
  }

*/ 