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
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0, bottom: 80.0),
              child: Image(
                image: AssetImage("images/login_logo.png"),
                fit: BoxFit.cover,
                width: 180.0,
              ),
            )
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(
                overflow: Overflow.visible,
                fit: StackFit.expand, // 针对没有定位的元素撑满stack, container没有子元素会自动撑满父元素
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(150.0)),
                      color: Color(0xfff6f6f6),
                      boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0)],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 20.0,
                    child: Container(
                      child: Column(children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: "用户名",
                              hintText: "用户名或邮箱",
                              prefixIcon: Icon(Icons.person)
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "用户名",
                              hintText: "用户名或邮箱",
                              prefixIcon: Icon(Icons.person)
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "密码",
                              hintText: "您的登录密码",
                              prefixIcon: Icon(Icons.lock)
                          ),
                          obscureText: true,
                        ),
                      ],),
                      width: 280.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [Color(0xff325CAF), Color(0xff6CA0D1)]
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..rotateZ(270 * 3.1415927 / 180),
                      child: Row(
                        children: <Widget>[
                          FlatButton(child: Text('FORGET PASSWORD'), onPressed: (){print('forget');}),
                          FlatButton(child: Text('SING UP'), onPressed: (){print('sign up');}),
                          FlatButton(child: Text('SING IN'), onPressed: (){print('sign in');}),
                        ],
                      )
                    )
                  )
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}
