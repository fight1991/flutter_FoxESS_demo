import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'StationList.dart';


class StationTab extends StatefulWidget {
  @override
  _StationTab createState() => _StationTab();
}
class _StationTab extends State<StationTab> with SingleTickerProviderStateMixin{
  List tabs = ['全部', '正常', '异常', '离线'];
  TabController _tabController;
  TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState(); 
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10.0),
          constraints: BoxConstraints(
            maxHeight: 40.0,
            // maxWidth: 200
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              prefixIcon: Icon(Icons.search, color: Colors.black45,),
              hintText: '输入电站名称',
              contentPadding: const EdgeInsets.symmetric(vertical: 6.0)
            ),
          )
        ),
        centerTitle: true,
        elevation: 4.0,
        leading: Text(''),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 15.0),
            icon: Text('搜索', style: TextStyle(fontSize: 16.0),),
            onPressed: () {
              // 查找
              // if (_nameController.text.trim().length == 0) {
              //   Fluttertoast.showToast(msg: '请输入电站名称');
              //   return;
              // }
              print(_tabController.index);
              // 调用子元素的方法
               childKey['key${_tabController.index}'].currentState.initList(_nameController.text.trim());
            },
          ),
        ],
        bottom: TabBar(
          tabs: tabs.map((v) => Tab(text: v,)).toList(),
          controller: _tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){Navigator.pushNamed(context, '/addStation');}),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          StationList(status: 0, key: childKey['key0']),
          StationList(status: 1, key: childKey['key1']),
          StationList(status: 2, key: childKey['key2']),
          StationList(status: 3, key: childKey['key3']),
        ],
      ),
    );
  }
}