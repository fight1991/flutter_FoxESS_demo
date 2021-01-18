
import "package:flutter/material.dart";
import "./Validate.dart";
import "../../util/index.dart";
// import '../../request/UserApi.dart';
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
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          formItem('用户名', _nameController, (v) {
            print(v);
            return Validate.userValid(v) ? null : '用户名格式不正确';
          }),
          formItem('密码', _pwdController, (v) {
            print(v);
            return Validate.pwdValid(v) ? null : '密码格式不正确';
          }),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () async{
                bool isPass = (_formKey.currentState as FormState).validate();
                if (isPass) {
                  // var res = await UserApi.goLogin({
                  //   'user': _nameController.text,
                  //   'password': Util.md5Encode(_pwdController.text)
                  // });
                  // print(res);
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
  Widget formItem (String label, TextEditingController controller, [Function validator]) {
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
              validator: validator ?? null
            ),
          ),
        ]
      ),
    );
  }
}