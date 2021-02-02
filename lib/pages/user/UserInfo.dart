import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import "../../common/Global.dart";
import "../../dio/UserApi.dart";
class UserInfo extends StatefulWidget {
  @override
  _UserInfo createState() => _UserInfo();
}
class _UserInfo extends State<UserInfo> {
  int access;
  // 终端永用户加入其它组织的代码
  TextEditingController _endUserJoinController = TextEditingController();
  // 代理商/安装商代码(显示)
  String _initCode = '';
  // 代理商邀请码
  String _agentCode = '';
  @override
  void initState() {
    access = Global.profile.user.access;
    if (access > 1) {
      getInviteCodeApi('installer');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var userInfo = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('我的信息'),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(vertical:10.0),
        child: ListView(
          children: <Widget>[
            listItem(
              title: '用户名',
              trailing: userInfo['name'],
              showBorder: true
            ),
            listItem(
              title: '用户类型',
              trailing: userInfo['roleName'],
              showBorder: true
            ),
            listItem(
              title: '软件版本',
              trailing: 'V2.0.0',
            ),
            ...listInfo(userInfo)
          ]
        ),
      )
    );
  }
  // 用户信息条目
  Widget listItem ({String title, String trailing = '',  Icon icon, Function onTap, bool showBorder = false, EdgeInsetsGeometry margin}) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: showBorder ? Colors.grey: Colors.transparent))),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 16.0),),
        leading: icon,
        trailing: Text(trailing, style: TextStyle(fontSize: 16.0),),
        onTap: onTap
      )
    );
  }
  // 权限判断
  List<Widget> listInfo (userInfo) {
    switch (userInfo['access']) {
      case 1:
        return [
          listItem(
            title: '关联安装商/代理商',
            icon: Icon(Icons.link, size: 30.0, color: Colors.green,),
            margin: EdgeInsets.only(top: 10.0),
            onTap: () async{
              bool isPass = await showCodeDialog('安装商/代理商代码');
              if (isPass) {
                joinApi('user');
              }
            },
          )
        ];
      case 2:
        return [
          listItem(
            title: '安装商代码',
            trailing: _initCode,
            margin: EdgeInsets.only(top: 10.0),
          ),
          listItem(
            title: '关联代理商',
            margin: EdgeInsets.only(top: 10.0),
            icon: Icon(Icons.link, size: 30.0, color: Colors.green,),
            onTap: () async{
              bool isPass = await showCodeDialog('代理商代码');
              if (isPass) {
                joinApi('installer');
              }
            },
          )
        ];
      case 3:
        return [
          listItem(
            title: '代理商代码',
            trailing: _initCode,
            margin: EdgeInsets.only(top: 10.0),
          ),
          listItem(
            title: '获取邀请码',
            icon: Icon(Icons.code, size: 30.0, color: Colors.green,),
            margin: EdgeInsets.only(top: 10.0),
            onTap: () async{
              getInviteCodeApi('agent');
            },
          )
        ];
      default:
        return [Container()];
    }
  }
  // 终端用户关联安装商/代理商
  Future<bool> showCodeDialog (label) {
    return showDialog<bool> (
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          // title: Text('安装商/代理商代码'),
          content: TextField(
            controller: _endUserJoinController,
            decoration: InputDecoration(
              hintText: label
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消', style: TextStyle(color: Colors.red),),
              // 关闭对话框
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text('确定'),
              // 关闭对话框并返回true
              onPressed: () {
                if (_endUserJoinController.text.trim().length == 0) {
                  Fluttertoast.showToast(msg: '代码不能为空');
                } else {
                  Navigator.of(context).pop(true);
                }
              },
            )
          ],
        );
      }
    );
  }
  // 加入组织api
  void joinApi (type) async {
    var res = await UserApi.joinOrgans({
      'code': _endUserJoinController.text,
      'organType': type
    });
    if (res) {
      Fluttertoast.showToast(msg: '操作成功');
    }
  }
  // 获取邀请码api
  void getInviteCodeApi (type) async{
    var res = await UserApi.getOrganCode({
      'organType': type
    });
    if (res != null) {
      if (type == 'installer') {
        setState(() {
          _initCode = res['code'];
        });
      } else {
        setState((){
          _agentCode = res['code'];
        });
      }
    }
  }
}