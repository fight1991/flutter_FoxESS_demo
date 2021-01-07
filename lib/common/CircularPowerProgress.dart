import "package:flutter/material.dart";
import './MyCircularProgress.dart';
class CircularPowerProgress extends StatelessWidget {
  final String currentPower;
  CircularPowerProgress({Key key, this.currentPower}):super(key: key);
  @override
  Widget build(BuildContext context) {
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
              Text(currentPower, style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold)),
              Text('当前功率(kw)')
            ]
          )
        ],
      ),
    );
  }
}