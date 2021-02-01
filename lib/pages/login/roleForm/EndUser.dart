

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hybridApp/dio/UserApi.dart';
import "package:provider/provider.dart";
import "../BaseDataProvider.dart";


import "../../../common/MyIcons.dart";
class EndUser extends StatefulWidget {
  final String type;
  EndUser({this.type});
  @override
  _EndUser createState() => _EndUser();
}
class _EndUser extends State<EndUser> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _snController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('终端用户'),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _snController,
                decoration: InputDecoration(
                  labelText: '模块SN',
                  icon: Text('*', style: TextStyle(color: Colors.red),),
                  suffixIcon: IconButton(
                    icon: Icon(MyIcons.scan,),
                    color: Colors.black,
                    onPressed: () {
                      // 打开摄像头
                    },
                  )
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null: 'SN不能为空';
                },
              ),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: '代码',
                  hintText: '代理商/安装商代码',
                  icon: Text('*', style: TextStyle(color: Colors.transparent),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Consumer<BaseData>(
                  builder: (context, baseData, child) {
                    return FlatButton(
                      color: Color(0xff3390ff),
                      minWidth: double.infinity,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async{
                        var _state = _formKey.currentState as FormState;
                        bool isPass = _state.validate();
                        if (isPass) {
                          var accountForm = baseData.baseForm;
                          accountForm['type'] = widget.type;
                          bool res = await UserApi.register({
                            'accountInfo': accountForm,
                            'userInfo': {
                              'sn': _snController.text,
                              'code': _codeController.text
                            }
                          });
                          // 注册成功, 重新登录
                          if (res) {
                            var isClose = await Fluttertoast.showToast(msg: '注册成功');
                            if (isClose) {
                              Navigator.of(context).pushNamedAndRemoveUntil('/',(Route<dynamic> route) => false, arguments: accountForm['account']);
                            }
                          }
                        }
                      }, 
                      child: child
                    );
                  },
                  child: Text('确定'),
                )
              )
            ]
          ),
        )
      ),
    );
  }
}