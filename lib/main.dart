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
      resizeToAvoidBottomPadding: false,
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
                      padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0, bottom: 40.0),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('ACCOUNT', style: TextStyle(color: Colors.white)),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffCBDBEF),
                                  borderRadius: BorderRadius.all(Radius.circular(18.0))
                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    )
                                  ),
                                ),
                              ),
                            ]
                          ),
                          SizedBox(width: double.infinity, height: 40.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('PASSWORD', style: TextStyle(color: Colors.white)),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffCBDBEF),
                                  borderRadius: BorderRadius.all(Radius.circular(18.0))
                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    )
                                  ),
                                ),
                              ),
                            ]
                          ),
                          SizedBox(width: double.infinity, height: 40.0,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.only(top:10.0, right:20.0, bottom:10.0, left:20.0),
                              decoration: BoxDecoration(
                                color: Color(0xff94C5FF),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0)]
                              ),
                              child: Image(
                                image: AssetImage("images/enter.png"),
                                fit: BoxFit.cover,
                                width: 45.0,
                              )
                            )
                          )
                        ],
                      ),
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
