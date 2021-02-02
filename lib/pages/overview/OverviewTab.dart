import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../common/CircularPowerProgress.dart';
import '../../common/PowerTitle.dart';
import '../../common/MyIcons.dart';
import '../../dio/PlantApi.dart';
class OverviewTab extends StatefulWidget {
  @override
  _OverviewTab createState() => _OverviewTab();
}
class _OverviewTab extends State<OverviewTab> {
  List<Map> swiperList = [
    {'item': '全部', 'num': 134},
    {'item': '正常', 'num': 123},
    {'item': '不正常', 'num': 3},
    {'item': '离线', 'num': 8},
  ];
  String currentP = '';
  String capacity = '';
  double percent = 0;
  Map statusObj = {
    'todayG': '--', // 今日发电
    'allG': '--', // 累计发电
  };
  @override
  void initState() {
    getEarningAll();
    super.initState();
  }
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
        onRefresh: getEarningAll,
        child: ListView(
          children: <Widget>[
            CircularPowerProgress(currentPower: currentP, value: percent,),
            todayAndTotalPower(),
            lineBottom(),
            mySwiper(swiperList)
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
  Widget mySwiper (List list) {
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
                  child: Text(list[index]['item'], style: TextStyle(fontSize: 30.0),),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(list[index]['num'].toString(), style: TextStyle(fontSize: 52.0, color: Colors.white, shadows: [Shadow(color: Colors.black54, offset: Offset(2.0, 1.0))]),),
                )
              ],
            ),
          );
        },
        itemCount: list.length,
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
  Future<Null>getEarningAll () async{
    var res = await PlantApi.earnings();
    if (res['errno'] == 0) {
      var temp = res['result'] as Map;
      var tempPower = temp['power'];
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
}