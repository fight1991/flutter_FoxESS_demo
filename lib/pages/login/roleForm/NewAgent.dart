

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hybridApp/dio/UserApi.dart';
import "package:provider/provider.dart";
import "../BaseDataProvider.dart";
class NewAgent extends StatefulWidget {
  final String type;
  NewAgent({this.type});
  @override
  _NewAgent createState() => _NewAgent();
}
class _NewAgent extends State<NewAgent> {
  GlobalKey _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _postController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建代理商'),
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
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '代理商名称',
                  icon: Text('*', style: TextStyle(color: Colors.red),),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null: '不能为空';
                },
              ),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(
                  labelText: '国家地区',
                  icon: Text('*', style: TextStyle(color: Colors.red),),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null: '不能为空';
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: '详细地址',
                  icon: Text('*', style: TextStyle(color: Colors.red),),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null: '不能为空';
                },
              ),
              TextFormField(
                controller: _postController,
                decoration: InputDecoration(
                  labelText: '邮编',
                  icon: Text('*', style: TextStyle(color: Colors.transparent),),
                ),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: '公司手机号',
                  icon: Text('*', style: TextStyle(color: Colors.transparent),),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '公司邮箱',
                  icon: Text('*', style: TextStyle(color: Colors.transparent),),
                ),
              ),
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: '备注',
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
                            'agentInfo': {
                              'code': '',
                              'detail': {
                                'name': _nameController.text,
                                'country': _countryController.text,
                                'address': _addressController.text,
                                'phone': _phoneController.text,
                                'postcode': _postController.text,
                                'note': _noteController.text
                              }
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