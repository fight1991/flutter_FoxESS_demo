import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hybridApp/dio/UserApi.dart';
import "./Validate.dart";

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPw createState() => _ForgetPw();
}
class _ForgetPw extends State<ForgetPw> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _code = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _pwdConfirm = TextEditingController();
  bool isAgree = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
                child: Text('获取验证码'),
                onPressed: (){},
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
            controller: _pwd,
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
            controller: _pwdConfirm,
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
    );
  }
}