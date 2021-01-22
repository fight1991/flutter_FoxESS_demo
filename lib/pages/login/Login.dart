
import 'package:flutter/material.dart';
import './SignIn.dart';
import './Register.dart';
import './ForgetPw.dart';
class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}
class _Login extends State<Login> {
  int currentIndex = 0;
  List<Widget> currentForm = [SignIn(), Register(), ForgetPw()];
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40.0),
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
                        padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30.0),
                        width: 280.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            colors: [Color(0xff325CAF), Color(0xff6CA0D1)]
                          )
                        ),
                        child: currentForm[currentIndex]
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
                            FlatButton(
                              child: Text('忘记密码', style: TextStyle(color: currentIndex==2 ? Color(0xff3390FF) : Colors.black26)),
                              onPressed: (){ changeStatus(2);}
                            ),
                            FlatButton(
                              child: Text('注册', style: TextStyle(color: currentIndex==1 ? Color(0xff3390FF) : Colors.black26)),
                              onPressed: (){ changeStatus(1);}
                            ),
                            FlatButton(
                              child: Text('登录', style: TextStyle(color: currentIndex==0 ? Color(0xff3390FF) : Colors.black26)),
                              onPressed: () { changeStatus(0);}
                            ),
                          ],
                        )
                      )
                    )
                  ]
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  void changeStatus (int index) {
    setState(() {
      currentIndex = index;
    });
  }
}