
import "package:flutter/material.dart";
import "../../common/MyIcons.dart";
import 'StationInfo.dart';
import 'DeviceInfo.dart';
import 'alarmInfo.dart';
class StationBottomBar extends StatefulWidget {
  @override
  _StationBottomBar createState() => _StationBottomBar();
}
class _StationBottomBar extends State<StationBottomBar> {
  int _selectedIndex = 0;
  String _stationId;
  @override
  Widget build (BuildContext context) {
    _stationId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            StationInfo(appBarTitle: _stationId),
            DeviceInfo(id: _stationId),
            AlarmInfo(id: _stationId)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(MyIcons.overview), title: Text('电站总览')),
          BottomNavigationBarItem(icon: Icon(MyIcons.device), title: Text('设备')),
          BottomNavigationBarItem(icon: Icon(MyIcons.alarm), title: Text('告警信息')),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          print(index.toString());
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}