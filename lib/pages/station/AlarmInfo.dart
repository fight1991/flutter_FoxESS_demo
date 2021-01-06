import "package:flutter/material.dart";
class AlarmInfo extends StatefulWidget {
  final String id;
  AlarmInfo({Key key, this.id}):super(key: key);
  @override
  _AlarmInfo createState() => _AlarmInfo();
}
class _AlarmInfo extends State<AlarmInfo> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('告警信息'),
        centerTitle: true,
      ),
    );
  }
}