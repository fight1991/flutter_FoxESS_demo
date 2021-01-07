import "package:flutter/material.dart";
import 'PlantList.dart';
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
          PlantList(type: 1),
          PlantList(type: 2),
          PlantList(type: 3),
          PlantList(type: 4),
        ],
      ),
    );
  }
}