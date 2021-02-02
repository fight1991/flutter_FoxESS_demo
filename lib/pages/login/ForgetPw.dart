import "package:flutter/material.dart";
import "dart:async";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hybridApp/dio/UserApi.dart';
import "../../util/index.dart";
import "./Validate.dart";

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPw createState() => _ForgetPw();
}
class _ForgetPw extends State<ForgetPw> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _code = TextEditingController();
  TextEditingController _newPwd = TextEditingController();
  TextEditingController _newPwdConfirm = TextEditingController();
  Timer _timer;
  String timerTxt = '获取验证码';
  int _count = 60;
  @override
  void dispose() {
    if (_timer != null) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  child: Icon(Icons.close, color: Colors.black54,),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text('重置密码', style: TextStyle(color: Colors.black, fontSize: 22.0),),
                )
              ]
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: _username,
              decoration: InputDecoration(
                labelText: '用户名',
                icon: Text('*', style: TextStyle(color: Colors.red),),
              ),
              validator: (v) {
                return Validate.userValid(v) ? null : '用户名格式错误';
              },
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: _code,
              decoration: InputDecoration(
                labelText: '验证码',
                icon: Text('*', style: TextStyle(color: Colors.red),),
                suffixIcon: FlatButton(
                  child: Text(timerTxt),
                  onPressed: () async {
                    if (_username.text.trim().length == 0) {
                      Fluttertoast.showToast(msg: '用户名不能为空!');
                      return;
                    }
                    if (_timer != null) return;
                    // 发送验证码
                    var res = await UserApi.getCode({
                      'user': _username.text
                    });
                    if (res['errno'] == 0) {
                      Fluttertoast.showToast(msg: '发送成功!');
                      // 开启定时器
                      myTimer();
                    }
                  },
                  splashColor: Colors.black12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                )
              ),
              validator: (v) {
                return Validate.codeValid(v) ? null : '验证码格式错误';
              },
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: _newPwd,
              decoration: InputDecoration(
                labelText: '密码',
                icon: Text('*', style: TextStyle(color: Colors.red),)
              ),
              validator: (v) {
                return Validate.pwdValid(v) ? null : '密码格式错误';
              },
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: _newPwdConfirm,
              decoration: InputDecoration(
                labelText: '确认密码',
                icon: Text('*', style: TextStyle(color: Colors.red),)
              ),
              validator: (v) {
                return Validate.userValid(v) ? null : '密码格式错误';
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: FlatButton(
                color: Color(0xff3390ff),
                minWidth: double.infinity,
                textColor: Colors.white,
                onPressed: () async{
                  var _state = _formKey.currentState as FormState;
                  bool isPass = _state.validate();
                  if (isPass) {
                    if (_newPwd.text != _newPwdConfirm.text) {
                      Fluttertoast.showToast(msg: '两次输入的密码不一致');
                      return;
                    }
                    bool res = await UserApi.restPw({
                      'newPassword': Util.md5Encode(_newPwd.text),
                      'user': _username.text,
                      'captcha': _code.text
                    });
                    if (res) {
                      Fluttertoast.showToast(msg: '重置成功,请重新登录!');
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false, arguments: _username.text);
                    }
                    // 下一步
                  } else {
                    print('未验证通过');
                  }
                }, 
                child: Text('重置')
              )
            )
          ],
        ),
      )
    );
  }
  myTimer () {
    setState(() {
      timerTxt = '${_count}S';
    });
    _timer = Timer.periodic(Duration(seconds : 1), (timer) {
      _count--;
      setState(() {
        timerTxt = '${_count}S';
        if (_count < 10 && _count > 0 ) {
          timerTxt = '0${_count}S';
        }
        if (_count < 0) {
          _count = 60;
          timerTxt = '获取验证码';
          timer.cancel();
          _timer = null;
        }
      });
    });
  }
}