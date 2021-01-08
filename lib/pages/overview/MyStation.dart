import "package:flutter/material.dart";
import 'StationList.dart';
class MyStation extends StatefulWidget {
  @override
  _MyStation createState() => _MyStation();
}
class _MyStation extends State<MyStation> with SingleTickerProviderStateMixin{
  List tabs = ['全部', '正常', '异常', '离线'];
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState(); 
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电站'),
        centerTitle: true,
        elevation: 4.0,
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
          tabs: tabs.map((v) => Tab(text: v,)).toList(),
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