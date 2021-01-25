
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
  List<Widget> currentForm;
  @override
  void initState() {
    currentForm = [
    SignIn(callback: (index){
      setState(() {
        currentIndex = index;
      });
    },),
    Register(),
    ForgetPw()
  ];
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
                    currentForm[currentIndex],
                    Positioned(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(onPressed: (){changeStatus(0);}, child: Text('登录', style: TextStyle(color: currentIndex==0?Color(0xff3390ff):Colors.black54),)),
                          FlatButton(onPressed: (){changeStatus(1);}, child: Text('注册')),
                          FlatButton(onPressed: (){changeStatus(2);}, child: Text('忘记密码')),
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
    setState(() {
      currentIndex = index;
    });
  }
}