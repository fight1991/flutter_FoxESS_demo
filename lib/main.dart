import "package:flutter/material.dart";
import "./pages/login/Login.dart";
import "./pages/login/Test.dart";
import './pages/overview/OverviewBottomBar.dart';
import './pages/overview/AddStation.dart';
import './pages/station/StationBottomBar.dart';
import './pages/device/DeviceTopBar.dart';
import './pages/remote/RemoteSetting.dart';
import './pages/user/UserInfo.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoxESS',
      initialRoute: '/overview',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(),
        '/test': (context) => Test(),
        '/overview': (context) => OverviewBottomBar(),
        '/addStation': (context) => AddStation(),
        '/stationTab': (context) => StationBottomBar(),
        '/deviceTab': (context) => DeviceTopBar(),
        '/remote': (context) => RemoteSetting(),
        '/userInfo': (context) => UserInfo(),
      },
      theme: ThemeData(
        // primaryColor: Colors.white,
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Color(0xff3390FF), fontSize: 18.0),
          bodyText1: TextStyle(color: Color(0xff3390FF), fontSize: 18.0),
          bodyText2: TextStyle(color: Color(0xff3390FF), fontSize: 14.0),
        ),
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}
