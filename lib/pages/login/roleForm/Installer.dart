

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hybridApp/dio/UserApi.dart';
import "package:provider/provider.dart";
import "../BaseDataProvider.dart";


import "../../../common/MyIcons.dart";
class Installer extends StatefulWidget {
  final String type;
  Installer({this.type});
  @override
  _Installer createState() => _Installer();
}
class _Installer extends State<Installer> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _snController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('安装商'),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _snController,
                decoration: InputDecoration(
                  labelText: '安装商名称',
                  icon: Text('*', style: TextStyle(color: Colors.red),),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null: '不能为空';
                },
              ),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: '代理商代码',
                  icon: Text('*', style: TextStyle(color: Colors.transparent),),
                ),
              ),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: '联系电话',
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
                            'installerInfo': {
                              'name': _snController.text,
                              'code': _codeController.text,
                              'phone': _phoneController.text
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