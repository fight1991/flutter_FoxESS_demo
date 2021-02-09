import "package:flutter/material.dart";
import "ElecTab.dart";
import "DataTab.dart";
import "BatteryTab.dart";
import "VersionTab.dart";
class DeviceTopBar extends StatefulWidget {
  @override
  _DeviceTopBar createState() => _DeviceTopBar();
}

class _DeviceTopBar extends State<DeviceTopBar> with SingleTickerProviderStateMixin {
  List tabs = ['电量统计', '实时数据', '电池', '版本信息'];
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text('设备SN'),
        centerTitle: true,
        bottom: TabBar(
          tabs: tabs.map((v) => Tab(text: v)).toList(),
          controller: _tabController,
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ElecTab(),
          DataTab(),
          BatteryTab(),
          VersionTab()
        ],
      ),
    );
  }
}