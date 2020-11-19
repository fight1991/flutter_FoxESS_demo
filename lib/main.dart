import "package:flutter/material.dart";
import "./login/Login.dart";
import "./login/Test.dart";
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoxESS',
      initialRoute: '/test',
      routes: {
        '/': (context) => Login(),
        '/test': (context) => Test(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white60)
        ),
        // scaffoldBackgroundColor: Color.lerp(Color.fromRGBO(0,67,107,1), Color.fromRGBO(2,36,59,1), 0.5)
      ),
    );
  }
}
