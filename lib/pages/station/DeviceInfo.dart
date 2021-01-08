import "package:flutter/material.dart";
import "./DeviceList.dart";
class DeviceInfo extends StatefulWidget {
  final String id;
  DeviceInfo({Key key, this.id}):super(key: key);
  @override
  _DeviceInfo createState() => _DeviceInfo();
}
class _DeviceInfo extends State<DeviceInfo> with SingleTickerProviderStateMixin{
  List tabList = ['全部', '正常', '异常', '离线'];
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: tabList.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备'),
        centerTitle: true,
        bottom: TabBar(
          tabs: tabList.map((v) => Tab(text: v,)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          DeviceList(type: 1),
          DeviceList(type: 2),
          DeviceList(type: 3),
          DeviceList(type: 4)
        ]
      ),
    );
  }
}