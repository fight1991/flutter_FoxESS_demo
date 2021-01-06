import "package:flutter/material.dart";
class DeviceInfo extends StatefulWidget {
  final String id;
  DeviceInfo({Key key, this.id}):super(key: key);
  @override
  _DeviceInfo createState() => _DeviceInfo();
}
class _DeviceInfo extends State<DeviceInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备详情'),
        centerTitle: true,
      ),
    );
  }
}