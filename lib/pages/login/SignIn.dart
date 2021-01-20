
import "package:flutter/material.dart";
import "./Validate.dart";
import "../../util/index.dart";
import '../../dio/UserApi.dart';
class SignIn extends StatefulWidget {
  @override
  _SignIn createState() => _SignIn();
}
class _SignIn extends State<SignIn> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _nameController.text = 'agent1234';
    _nameController.text = 'fight1991';
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          formItem('用户名', _nameController, () {
            if (!Validate.userValid(_nameController.text)) {
              showBottomDialog();
            }
          }),
          formItem('密码', _pwdController, () {
            // return Validate.pwdValid(_nameController.text) ? null : '密码格式不正确';
          }),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () async{
                bool isPass = (_formKey.currentState as FormState).validate();
                if (isPass) {
                  var res = await UserApi.login({
                    'user': _nameController.text,
                    'password': Util.md5Encode(_pwdController.text)
                  });
                  // print(res);
                  // Navigator.of(context).pushNamed('/overview');
                } else {
                  print('未验证通过');
                }
                // if(Form.of(context).validate()){
                //   Navigator.of(context).pushNamed('/overview');
                // } else {
                //   print('未验证通过');
                // }
              },
              child: Container(
                padding: EdgeInsets.only(top:10.0, right:20.0, bottom:10.0, left:20.0),
                margin: EdgeInsets.only(top: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff94C5FF),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0)]
                ),
                child: Image(
                  image: AssetImage("images/enter.png"),
                  fit: BoxFit.cover,
                  width: 35.0,
                )
              )
            )
          )
        ],
      ),
    );
  }
  Widget formItem (String label, TextEditingController controller, [Function onEditingComplete]) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: TextStyle(color: Colors.white)),
          Container(
            // constraints: BoxConstraints(maxHeight: 30.0),
            height: 30.0,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Color(0xffCBDBEF),
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: TextFormField(
              controller: controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              onEditingComplete: onEditingComplete ?? null
            ),
          ),
        ]
      ),
    );
  }
  // 底部弹框
  showBottomDialog () {
    // showBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Container(height: 200, color: Colors.lightBlue);
    //   });
  }
}