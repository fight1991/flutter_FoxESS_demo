

import "package:flutter/material.dart";
import "../../../common/MyIcons.dart";
class EndUser extends StatefulWidget {
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
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
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
                child: FlatButton(
                  color: Color(0xff3390ff),
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () async{
                    var _state = _formKey.currentState as FormState;
                    bool isPass = _state.validate();
                    if (isPass) {
                      
                    }
                  }, 
                  child: Text('确定')
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}