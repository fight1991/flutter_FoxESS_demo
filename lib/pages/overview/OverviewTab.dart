import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hybridApp/common/CircularPowerProgress.dart';
import 'package:hybridApp/common/PowerTitle.dart';
import 'package:hybridApp/common/MyIcons.dart';
import 'package:hybridApp/dio/PlantApi.dart';
class OverviewTab extends StatefulWidget {
  @override
  _OverviewTab createState() => _OverviewTab();
}
class _OverviewTab extends State<OverviewTab> with AutomaticKeepAliveClientMixin {
  List<String> swiperKeys = ['全部', '正常', '不正常', '离线'];
  List<dynamic> swiperValues = [0, 0, 0, 0];
  String currentP = '0';
  String capacity = '0';
  double percent = 0;
  Map statusObj = {
    'todayG': '--', // 今日发电
    'allG': '--', // 累计发电
  };
  @override
  void initState() {
    getAll(true);
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('总览'),
        elevation: 10.0,
        centerTitle: true,
        leading: Text(''),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal:15.0),
            child: Icon(MyIcons.map),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{return getAll(false);},
        child: ListView(
          children: <Widget>[
            CircularPowerProgress(currentPower: currentP, value: percent,),
            todayAndTotalPower(),
            lineBottom(),
            mySwiper()
          ]
        ),
      )
    );
  }
  //所有电站今日功率和总功率
  Widget todayAndTotalPower () {
    return Container(
      padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 40.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          PowerTitle(
            label: '今日发电(kWh)',
            value: statusObj['todayG']
          ),
          PowerTitle(
            label: '累计发电(kWh)',
            value: statusObj['allG']
          ),
          PowerTitle(
            label: '组件容量(kW)',
            value: capacity
          ),
        ]
      ),
    );
  }
  // 下划线
  Widget lineBottom () {
    return Divider(color: Colors.blue,thickness: 2.0, indent: 40.0, endIndent: 40.0,);
  }
  // 轮播图
  Widget mySwiper () {
    return Container(
      width: 500.0,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xffF6F6F6), Color(0xffE3E3E3)]),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(swiperKeys[index], style: TextStyle(fontSize: 30.0),),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(swiperValues[index].toString(), style: TextStyle(fontSize: 52.0, color: Colors.white, shadows: [Shadow(color: Colors.black54, offset: Offset(2.0, 1.0))]),),
                )
              ],
            ),
          );
        },
        itemCount: swiperKeys.length,
        outer: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.black26,
            activeColor: Colors.blue,
          )
        ),
      ),
    );
  }
  Future<Null>getAll (loading) async{
    var res = await PlantApi.all(loading);
    if (null != res[0]) {
      computeEarningData(res[0]);
    }
    if (null != res[1]) {
      computeStatusData(res[1]);
    }
  }
  // 处理收益相关数据
  computeEarningData (Map<String, dynamic> res) {
    if (res['errno'] == 0) {
      var temp = res['result'] as Map;
      var tempPower = temp['power'].abs();
      var tempCapa = temp['systemCapacity'];
      var tempPercent = 0;
      if (tempCapa > 0) {
        tempPercent = (tempPower*100 / tempCapa).abs().ceil();
        print(tempPercent);
      }
      setState(() {
        statusObj['todayG'] = temp['generation']['today'].toStringAsFixed(2);
        statusObj['allG'] = temp['generation']['cumulate'].toStringAsFixed(2);
        capacity = tempCapa.toStringAsFixed(2);
        currentP = tempPower.toStringAsFixed(2);
        percent = tempPercent / 100;
      });
    }
  }
  // 处理状态相关数据
  computeStatusData (Map<String, dynamic> res) {
    if (res['errno'] == 0) {
      var tempValue = [];
      var tempR = res['result'] as Map;
      tempR.forEach((key, value) {
        tempValue.add(value);
      });
      setState(() {
        swiperValues = tempValue;
      });
    }
  }
}