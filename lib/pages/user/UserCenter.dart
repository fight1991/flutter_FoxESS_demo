
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import '../../common/Global.dart';
import "../../common/MyIcons.dart";
import "../../dio/UserApi.dart";
class UserCenter extends StatefulWidget {
  @override
  _UserCenter createState() => _UserCenter();
}
class _UserCenter extends State<UserCenter> {
  String username = '';
  String roleName = '';
  int access;
  @override
  void initState() {
    username = Global.profile.user.user;
    access = Global.profile.user.access;
    roleName = getRoleName(access);
    print(roleName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('我的'),
      //   elevation: 10.0,
      //   centerTitle: true,
      //   leading: Text(''),
      // ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/userLogo.png'),
              ),
              accountName: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(username, style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              accountEmail: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(roleName),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    color: Colors.white,
                    child: ListTile(
                      title: Text('我的信息', style: TextStyle(color: Colors.black),),
                      leading: Icon(MyIcons.user_outline, size: 40.0, color: Colors.blue,),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).pushNamed('/userInfo', arguments: {'name': username, 'roleName': roleName, 'access': access});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    color: Colors.white,
                    child: ListTile(
                      title: Text('退出', style: TextStyle(color: Colors.black)),
                      leading: Icon(MyIcons.close, size: 40.0, color: Colors.red,),
                      onTap: () async {
                        bool isOut = await showAlertDialog();
                        if (isOut) {
                          var res = await UserApi.logOut();
                          if (res) {
                            // 确认框
                            Fluttertoast.showToast(msg: '注销成功');
                            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false,);
                          }
                        }
                      },
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  // 退出登录按钮
  Widget logoutBtn () {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      width: 300.0,
      child: RaisedButton(
        child: Text('退出登录'),
        textColor: Colors.white,
        color: Color(0xff3390ff),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: (){}
      ),
    );
  }
  Future<bool> showAlertDialog () {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('确定要退出吗?'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              // 关闭对话框
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('确定'),
              // 关闭对话框并返回true
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      }
    );
  }
  String getRoleName (access) {
    switch (access) {
      case 1:
        return '终端用户';
      case 2:
        return '安装商';
      case 3:
        return '代理商';
      default:
        return '厂商';
    }
  }
}