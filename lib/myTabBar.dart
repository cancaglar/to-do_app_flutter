import 'package:flutter/material.dart';
import 'package:todoapp/constants.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TabBarButtons('assets/to-do-list.png', 'todo'),
        TabBarButtons('assets/chronometer.png', 'timer'),
        TabBarButtons('assets/calendar.png', 'calender'),
        TabBarButtons('assets/cloud.png', 'cloud'),
        TabBarButtons('assets/settings.png', 'settings'),
      ],
    );
  }
}

class TabBarButtons extends StatefulWidget {
  String iconUrl = '';
  String pageName = '';
  TabBarButtons(String iconUrl, String pageName) {
    this.iconUrl = iconUrl;
    this.pageName = pageName;
  }

  @override
  State<TabBarButtons> createState() => _TabBarButtonsState();
}

class _TabBarButtonsState extends State<TabBarButtons> {
  double buttonBorderSize = 3;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        //padding: EdgeInsets.zero,
        child: Ink(
            decoration: BoxDecoration(
                border:
                    (Border.all(color: Colors.black, width: buttonBorderSize)),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 65,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: BUTTON_COLOR),
                child: Image.asset(
                  widget.iconUrl,
                ),
                onPressed: () {
                  setState(() {
                    if (widget.pageName == 'todo') {
                      buttonBorderSize = 0;
                    }
                  });
                },
              ),
            )),
      ),
    );
  }
}
