import "package:flutter/material.dart";
class VersionTab extends StatefulWidget {
  @override
  _VersionTab createState() => _VersionTab();
}
class _VersionTab extends State<VersionTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('设备版本信息'),
      ),
    );
  }
}