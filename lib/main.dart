import "package:flutter/material.dart";
import "./login/Login.dart";
import "./login/Test.dart";
import 'overview/TabPage.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoxESS',
      initialRoute: '/overview',
      routes: {
        '/': (context) => Login(),
        '/test': (context) => Test(),
        '/overview': (context) => TabPage()
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white60),
          bodyText2: TextStyle(color: Color(0xff3390FF), fontSize: 20.0)
        ),
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}
