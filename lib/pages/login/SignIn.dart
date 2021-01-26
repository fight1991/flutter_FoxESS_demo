
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../provider/UserModel.dart";
import "./Validate.dart";
import "../../util/index.dart";
import '../../dio/UserApi.dart';
class SignIn extends StatefulWidget {
  SignIn({this.callback});
  final Function callback;
  @override
  _SignIn createState() => _SignIn();
}
class _SignIn extends State<SignIn> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  bool isRemeber = true;
  @override
  Widget build(BuildContext context) {
    _nameController.text = 'agent1234';
    _pwdController.text = 'fight1991';
    return Form(
      key: _formKey,
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
          formItem('用户名', _nameController, 
            validator: (v) {
              return Validate.userValid(v) ? null : '用户名格式错误';
            }
          ),
          formItem('密码', _pwdController, 
            validator: (v) {
              return Validate.pwdValid(v) ? null : '密码格式错误';
            }
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30.0,
                      height: 20.0,
                      child: Checkbox(value: isRemeber, onChanged: (bool) {
                        setState(() {
                          isRemeber = !isRemeber;
                        });
                      }),
                    ),
                    Text('记住密码'),
                  ],
                )
              ],
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
                  var res = await UserApi.login({
                    'user': _nameController.text,
                    'password': Util.md5Encode(_pwdController.text)
                  });
                  if (null != res) {
                    // 持久化用户信息
                    print(res);
                    // Provider.of<UserModel>(context,listen: false).user = res;
                    context.read<UserModel>().user = res;
                    var aa = context.read<UserModel>().user;
                    print(aa.user);
                    Navigator.of(context).pushNamed('/overview');
                  }
                  // print(res);
                  // Navigator.of(context).pushNamed('/overview');
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
  Widget formItem (String label, TextEditingController controller, {Function onEditingComplete, Function validator, Function onSaved}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controller,      
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              // labelText: label,
              prefixIcon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.up,
                children: [Text(label, style: TextStyle(color:Colors.black87,fontSize: 16.0),),SizedBox(width:30.0)],
              )
              
              // isDense: true,
              // border: OutlineInputBorder(borderSide: BorderSide(width:1.0),borderRadius: BorderRadius.all(Radius.circular(10.0)))
            ),
            onEditingComplete: onEditingComplete ?? null,
            validator: validator ?? null,
            onSaved: onSaved ?? null
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