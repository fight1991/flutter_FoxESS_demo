import "package:flutter/material.dart";
import 'Overview.dart';
import 'Station.dart';
import 'My.dart';
class Index extends StatefulWidget {
 @override
 _Index createState() => _Index();
}
class _Index extends State<Index> {
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
            Station(),
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
        onTap: _onBottomItemTap,
      ),
    );
  }
  Widget getCurrentBottomTabPage (index) {
    var currentPage;
    switch (index) {
      case 0:
        currentPage = Overview();
        break;
      case 1:
        currentPage = Station();
        break;
      case 2:
        currentPage = My();
        break;
      default:
        currentPage = null;
       break;
    }
    return currentPage;
  }
  void _onBottomItemTap (int index) {
    setState((){
      _selectedIndex = index;
      currentPage = getCurrentBottomTabPage(index);
    });
    print(index);
  }
}