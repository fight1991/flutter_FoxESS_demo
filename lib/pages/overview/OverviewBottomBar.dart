import "package:flutter/material.dart";
import "../../common/MyIcons.dart";
import "../user/UserCenter.dart";
import 'OverviewTab.dart';
import 'StationTab.dart';
class OverviewBottomBar extends StatefulWidget {
 @override
 _OverviewBottomBar createState() => _OverviewBottomBar();
}
class _OverviewBottomBar extends State<OverviewBottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            OverviewTab(),
            StationTab(),
            UserCenter()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(MyIcons.data_overview), label: '总览'),
          BottomNavigationBarItem(icon: Icon(MyIcons.station), label: '我的电站'),
          BottomNavigationBarItem(icon: Icon(MyIcons.user), label: '我'),
        ],
        fixedColor: Color(0xff3390FF),
        onTap: (int index) {
          setState((){
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}