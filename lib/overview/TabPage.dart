import "package:flutter/material.dart";
import "./My.dart";
import "./Plant.dart";
import "Overview.dart";
class TabPage extends StatefulWidget {
  @override
  _TabPage createState() => _TabPage();
}
class _TabPage extends State<TabPage> with SingleTickerProviderStateMixin {
  List tabs = ["OVERVIEW", "STATION", "ME"];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    TextStyle _appBarTextColor = Theme.of(context).textTheme.bodyText2;
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Overview(),
          Plant(),
          My()
        ]
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          labelColor: _appBarTextColor.color,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.black26,
          unselectedLabelStyle: TextStyle(backgroundColor: Colors.transparent),
          labelStyle: TextStyle(height: 1, fontSize: 14),
          tabs: tabs.map((item) => Tab(
            text: item
          )).toList()
        ),
      )
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   child: Row(
      //     children: [],
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   ),
      // ),
    );
  }
}
