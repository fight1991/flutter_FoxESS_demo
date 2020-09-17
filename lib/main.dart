import "package:flutter/material.dart";
import "./dashBoard/index.dart";
import "./myPlant/index.dart";
import "./user/index.dart";
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoxEss',
      home: Home(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(4,60,97, 1),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white60)
        ),
        scaffoldBackgroundColor: Color.lerp(Color.fromRGBO(0,67,107,1), Color.fromRGBO(2,36,59,1), 0.5)
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('总览'),
        //   centerTitle: true,
        // ),
        body: TabBarView(children: <Widget>[
          DashBoard(),
          MyPlant(),
          User(),
        ]),
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
      ),
    );
  }
}
