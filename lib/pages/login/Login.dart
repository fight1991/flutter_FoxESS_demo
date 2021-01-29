
import 'package:flutter/material.dart';
import './SignIn.dart';
import './Register.dart';
import './ForgetPw.dart';
class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}
class _Login extends State<Login> {
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
        padding: EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.expand, // 针对没有定位的元素撑满stack, container没有子元素会自动撑满父元素
                  children: <Widget>[
                    // currentForm[currentIndex],
                    SignIn(),
                    Positioned(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(onPressed: (){changeStatus(1);}, child: Text('注册', style: TextStyle(color: Colors.black54))),
                          FlatButton(onPressed: (){changeStatus(2);}, child: Text('忘记密码', style: TextStyle(color: Colors.black54))),
                        ],
                      ),
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
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
    if (index == 1) {// 打开注册页面
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register()
        )
      );
    }
  }
}