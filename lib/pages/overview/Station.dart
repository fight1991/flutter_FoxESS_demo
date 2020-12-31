import "package:flutter/material.dart";
class Station extends StatefulWidget {
  @override
  _Station createState() => _Station();
}
class _Station extends State<Station> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电站'),
        elevation: 0.0,
        centerTitle: true,
        leading: Text(''),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal:15.0),
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}