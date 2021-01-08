import "package:flutter/material.dart";
import 'package:hybridApp/common/CircularPowerProgress.dart';
import "../../common/CircularPowerProgress.dart";
import "../../common/PowerTitle.dart";
class ElecTab extends StatefulWidget {
  @override
  _ElecTab createState() => _ElecTab();
}
class _ElecTab extends State<ElecTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            CircularPowerProgress(currentPower: '2323'),
            todayAndTotalPower(),
            lineBottom(),
            Center(child: Text('echart'),)
          ],
        ),
      ),
    );
  }
   //设备今日功率和总功率
  Widget todayAndTotalPower () {
    return Container(
      padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 40.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          PowerTitle(
            label: '今日发电(kWh)',
            value: '5555.55'
          ),
          PowerTitle(
            label: '累计发电(kWh)',
            value: '552355.55'
          ),
          PowerTitle(
            label: '组件容量(kW)',
            value: '444.55'
          ),
        ]
      ),
    );
  }
  // 下划线
  Widget lineBottom () {
    return Divider(color: Colors.blue,thickness: 2.0, indent: 40.0, endIndent: 40.0,);
  }
}