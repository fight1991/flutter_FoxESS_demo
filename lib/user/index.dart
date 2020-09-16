import 'package:flutter/material.dart';
class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
      body: Center(child: Text('个人中心'),),
    );
  }
}