import "package:flutter/material.dart";
import '../../common/MyCircularProgress.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class Overview extends StatefulWidget {
  @override
  _Overview createState() => _Overview();
}
class _Overview extends State<Overview> {
  List swiperList = ['正常', '不正常', '离线'];
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
            child: Icon(Icons.map),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          currentPower(),
          todayAndTotalPower(),
          lineBottom(),
          mySwiper(swiperList)
        ]
      )
    );
  }
  // 当前功率
  Widget currentPower () {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.black26,
          offset: Offset(-2.0, 0.0),
          blurRadius: 4.0,
          spreadRadius: 1.0
        )],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150.0)),
        gradient: LinearGradient(
          colors: [Color(0xfff0f0f0), Color(0xffd9d9d9)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // 进度条
          MyCircularProgress(
            radius: 125.0, // 圆的半径
            backgroundColor: Colors.white,
            strokeWidth: 12.0,
            colors: [Colors.blue, Colors.blue],
            value: .5,
          ),
          Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('23.00', style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold)),
              Text('当前功率(kw)')
            ]
          )
        ],
      ),
    );
  }
  //今日功率和总功率
  Widget todayAndTotalPower () {
    return Container(
      padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 40.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.power),
              Text('今日功率(kW)'),
              SizedBox(width: 10.0,),
              Text('5555.55')
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.power),
              Text('总功率(kW)'),
              SizedBox(width: 10.0,),
              Text('2255.55')
            ],
          )
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey,
            ),
            child: Text(index.toString()),
          );
        },
        itemCount: list.length,
        outer: true,
        pagination: SwiperPagination()
      ),
    );
  }
}