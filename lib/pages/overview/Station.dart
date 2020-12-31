import "package:flutter/material.dart";
class Station extends StatefulWidget {
  @override
  _Station createState() => _Station();
}
class _Station extends State<Station> with SingleTickerProviderStateMixin{
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal:15.0),
            child: Icon(Icons.add),
          )
        ],
        bottom: TabBar(
          tabs: tabs.map((v) => Text(v)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text('1'),
          Text('2'),
          Text('3'),
          Text('4')
        ],
      ),
    );
  }
}