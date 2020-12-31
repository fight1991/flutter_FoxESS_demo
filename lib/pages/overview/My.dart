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
        title: Text('我的'),
        elevation: 0.0,
        centerTitle: true,
        leading: Text(''),
      ),
    );
  }
}