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
      body: TabBarView(
        children: <Widget>[
          Text('OVERVIEW'),
          Text('STATION'),
          Text('ME'),
        ]
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.black12,
        child: TabBar(
          labelColor: _appBarTextColor.color,
          labelStyle: TextStyle(height: 0, fontSize: 10),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.add), text: 'OVERVIEW',),
            Tab(icon: Icon(Icons.add), text: 'OVERVIEW',),
            Tab(icon: Icon(Icons.add), text: 'OVERVIEW',),

            // Tab(text: 'STATION',),
            // Tab(text: 'ME',)
          ]
        ),
      )
    );
  }
}
