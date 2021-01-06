
import "package:flutter/material.dart";
import "./StationInfo.dart";
import "./DeviceInfo.dart";
import "./alarmInfo.dart";
class StationTab extends StatefulWidget {
  @override
  _StationTab createState() => _StationTab();
}
class _StationTab extends State<StationTab> {
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('电站概览')),
          BottomNavigationBarItem(icon: Icon(Icons.devices), title: Text('设备详情')),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('告警信息')),
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