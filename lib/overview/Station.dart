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
        title: Text('Station'),
        centerTitle: true,
        leading: Text(''),
        actions: <Widget>[Icon(Icons.add)],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green,
            child: TextField(),
          ),
          Expanded(
            child: Text('list')
          )
        ],
      ),
    );
  }
}