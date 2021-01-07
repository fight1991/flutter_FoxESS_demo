import "package:flutter/material.dart";
import 'Overview.dart';
import 'MyStation.dart';
import 'My.dart';
class IndexTab extends StatefulWidget {
 @override
 _IndexTab createState() => _IndexTab();
}
class _IndexTab extends State<IndexTab> {
  int _selectedIndex = 0;
  Widget currentPage = Overview();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            Overview(),
            MyStation(),
            My()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('总览')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('我的电站')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的')),
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