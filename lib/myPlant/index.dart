import "package:flutter/material.dart";
import "../myPlant/plantList.dart";
class MyPlant extends StatefulWidget {
  @override
  _MyPlant createState() => _MyPlant();
}
class _MyPlant extends State<MyPlant> {
  List _tabs = ['全部电站', '正常电站', '异常电站', '离线'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('我的电站'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Material(
              color: Color.fromRGBO(4,85,138, 1),
              child: TabBar(
                indicatorColor: Color.fromRGBO(242,129,2,1),
                unselectedLabelColor: Colors.white70,
                tabs: <Widget>[
                  Tab(text: '全部'),
                  Tab(text: '正常'),
                  Tab(text: '异常'),
                  Tab(text: '离线')
                ],
              ),
            ),
          )
        ),
        body: TabBarView(
          children:  _tabs.map((v) => PlantList(type: v)).toList()
        )
      )
    );
  }
}