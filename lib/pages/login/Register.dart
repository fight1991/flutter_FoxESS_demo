import "package:flutter/material.dart";
class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}
class _Register extends State<Register> {
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: '用户名',
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: '邮箱',
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: '密码',
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: '确认密码',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: FlatButton(
              color: Color(0xff3390ff),
              minWidth: double.infinity,
              textColor: Colors.white,
              onPressed: () async{
                var _state = _formKey.currentState as FormState;
                bool isPass = _state.validate();
                if (isPass) {
                  
                } else {
                  print('未验证通过');
                }
              }, 
              child: Text('登录')
            )
          )
        ],
      ),
    );
  }
}