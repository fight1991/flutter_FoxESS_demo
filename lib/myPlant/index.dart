import "package:flutter/material.dart";
class MyPlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的电站'),
        centerTitle: true,
      ),
      body: Center(child: Text('我的电站'),),
    );
  }
}