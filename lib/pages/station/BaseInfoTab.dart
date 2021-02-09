import "package:flutter/material.dart";
import 'package:hybridApp/common/CircularPowerProgress.dart';
import 'package:hybridApp/common/PowerTitle.dart';
class BaseInfoTab extends StatelessWidget {
  final String appBarTitle;
  BaseInfoTab({Key key, @required this.appBarTitle}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            CircularPowerProgress(currentPower: '66.32',),
            todayAndTotalPower(),
            lineBottom(),
            Center(child: Text('echart'),)
          ],
        ),
      ),
    );
  }
  // 电站今日发电及总功率
  Widget todayAndTotalPower () {
    return Container(
      padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 40.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          PowerTitle(
            label: '今日发电(kWh)',
            value: '232.33',
          ),
          PowerTitle(
            label: '累计发电(kWh)',
            value: '2332.77',
          )
        ]
      ),
    );
  }
  // 下划线
  Widget lineBottom () {
    return Divider(color: Colors.blue,thickness: 2.0, indent: 40.0, endIndent: 40.0,);
  }
}