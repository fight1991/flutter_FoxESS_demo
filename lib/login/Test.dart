import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _Test createState() => _Test();
}
class _Test extends State<Test> {
  int currentIndex = 0;
  Widget currentWidget;
  void changeStatus (int type) {
    setState(() {
      currentIndex = type;
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: 200.0,
        child: TextField()
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(4,60,97, 1)),
        height: 50,
        child: TabBar(
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.white70,
          labelColor: Color.fromRGBO(242,129,2,1),
          labelStyle: TextStyle(height: 0, fontSize: 10),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.dashboard), text: '总览',),
            Tab(icon: Icon(Icons.speaker), text: '我的电站',),
            Tab(icon: Icon(Icons.person), text: '我的',),
          ],
          // labelColor: Colors.black,
        ),
      )
    );
  }
}