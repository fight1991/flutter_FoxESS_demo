import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import './RoleType.dart';
import 'package:hybridApp/dio/UserApi.dart';
import "./Validate.dart";

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}
class _Register extends State<Register> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _pwdConfirm = TextEditingController();
  bool isAgree = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    child: Text('用户注册', style: TextStyle(color: Colors.black, fontSize: 22.0),),
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
                controller: _email,
                decoration: InputDecoration(
                  labelText: '邮箱',
                  icon: Text('*', style: TextStyle(color: Colors.transparent),)
                ),
                validator: (v) {
                  return Validate.emailValid(v) ? null : '邮箱格式错误';
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
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(value: true,toggleable:true, groupValue: isAgree, onChanged: (value){
                      setState(() {
                        isAgree = !isAgree;
                      });
                    }),
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: '已阅读并同意',
                          style: TextStyle(color:Colors.black87)
                        ),
                        TextSpan(
                          text: '《服务协议》',
                          style: TextStyle(
                          ),  
                        ),
                      ]
                    ))
                  ],
                ),
              ),
              FlatButton(
                color: Color(0xff3390ff),
                minWidth: double.infinity,
                textColor: Colors.white,
                onPressed: () async{
                  var _state = _formKey.currentState as FormState;
                  bool isPass = _state.validate();
                  if (isPass) {
                    if (!isAgree) {
                      Fluttertoast.showToast(msg: '请勾选阅读协议');
                      return false;
                    }
                    // 下一步
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => RoleType())
                    );
                  } else {
                    print('未验证通过');
                  }
                }, 
                child: Text('下一步')
              )
            ],
          ),
        ),
      )
    );
  }
}