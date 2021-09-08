import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TabBarButtons('assets/to-do-list.png'),
        TabBarButtons('assets/chronometer.png'),
        TabBarButtons('assets/calendar.png'),
        TabBarButtons('assets/cloud.png'),
        TabBarButtons('assets/settings.png'),
      ],
    );
  }
}

class TabBarButtons extends StatelessWidget {
  String iconUrl = '';
  TabBarButtons(String iconUrl) {
    this.iconUrl = iconUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        //padding: EdgeInsets.zero,
        child: Ink(
            decoration: BoxDecoration(
                border: (Border.all(color: Colors.black, width: 3)),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 65,
              child: IconButton(
                icon: Image.asset(
                  iconUrl,
                ),
                onPressed: () {},
              ),
            )),
      ),
    );
  }
}
