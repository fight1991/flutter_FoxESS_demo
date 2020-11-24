import "package:flutter/material.dart";
class My extends StatefulWidget {
  @override
  _My createState() => _My();
}
class _My extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My'),
        centerTitle: true,
        leading: Text(''),
      ),
      body: Center(child: Text('我的页面'),),
    );
  }
}