import "package:flutter/material.dart";
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoxESS',
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
    return Scaffold(
      appBar: AppBar(
        title: Text('login')
      ),
      body: Center(
        child: Text('登录'),
      ),
    );
  }
}
