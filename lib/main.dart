import "package:flutter/material.dart";
import "./login/Login.dart";
import "./login/Test.dart";
import "./overview/Overview.dart";
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
        '/overview': (context) => Overview()
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white60),
          bodyText2: TextStyle(color: Color(0xff3390FF), fontSize: 20.0)
        ),
        // scaffoldBackgroundColor: Color.lerp(Color.fromRGBO(0,67,107,1), Color.fromRGBO(2,36,59,1), 0.5)
      ),
    );
  }
}
