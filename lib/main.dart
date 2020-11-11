import "package:flutter/material.dart";
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoxESS',
      home: Home(),
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image(
                image: AssetImage("images/login_logo.png"),
                fit: BoxFit.cover,
                width: 100.0,
                height: 30.0,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 380.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(150.0)),
                  color: Color(0xfff6f6f6),
                  boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0)],
                ),
              )
            ),
            Positioned(
              bottom: 80.0,
              right: 20.0,
              child: Container(
                child: Text('hah'),
                width: 280.0,
                height: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [Color(0xff325CAF), Color(0xff6CA0D1)]
                  )
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}
