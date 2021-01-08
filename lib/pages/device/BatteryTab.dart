import "package:flutter/material.dart";
class BatteryTab extends StatefulWidget {
  @override
  _BatteryTab createState() => _BatteryTab();
}
class _BatteryTab extends State<BatteryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('电池状态'),
      ),
    );
  }
}