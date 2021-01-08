import "package:flutter/material.dart";
import 'StationList.dart';
class MyStation extends StatefulWidget {
  @override
  _MyStation createState() => _MyStation();
}
class _MyStation extends State<MyStation> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List tabs = ['全部', '正常', '异常', '离线'];
  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电站'),
        elevation: 10.0,
        centerTitle: true,
        leading: Text(''),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addStation');
            },
          ),
        ],
        bottom: TabBar(
          tabs: tabs.map((v) => Text(v)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          StationList(type: 1),
          StationList(type: 2),
          StationList(type: 3),
          StationList(type: 4),
        ],
      ),
    );
  }
}