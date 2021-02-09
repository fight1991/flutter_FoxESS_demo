import "package:flutter/material.dart";
class AlarmTab extends StatefulWidget {
  final String id;
  AlarmTab({Key key, this.id}):super(key: key);
  @override
  _AlarmTab createState() => _AlarmTab();
}
class _AlarmTab extends State<AlarmTab> {
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