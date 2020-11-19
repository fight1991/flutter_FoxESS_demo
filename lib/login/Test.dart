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
      )
    );
  }
}