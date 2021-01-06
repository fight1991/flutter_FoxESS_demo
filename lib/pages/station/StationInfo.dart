import "package:flutter/material.dart";
class StationInfo extends StatelessWidget {
  final String appBarTitle;
  StationInfo({Key key, @required this.appBarTitle}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Container(
        child: Text('电站概览'),
      ),
    );
  }
}