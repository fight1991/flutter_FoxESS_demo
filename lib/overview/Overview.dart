import "package:flutter/material.dart";
class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _appBarTextColor = Theme.of(context).textTheme.bodyText2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Overview', style: _appBarTextColor),
        centerTitle: true,
        backgroundColor: Color(0xfff6f6f6),
        leading: Icon(Icons.arrow_back_ios, color: _appBarTextColor.color,),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.location_on, color: _appBarTextColor.color,),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('OVERVIEW'),
            Text('STATION'),
            Text('ME')
          ]
        ),
      )
    );
  }
}
