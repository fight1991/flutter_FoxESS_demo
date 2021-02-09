import "package:flutter/material.dart";
import "./roleForm/EndUser.dart";
import "./roleForm/Installer.dart";
import "./roleForm/JoinAgent.dart";
import './roleForm/NewAgent.dart';
class RoleType extends StatefulWidget {
  @override
  _RoleType createState() => _RoleType();
}
class _RoleType extends State<RoleType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户类型'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              roleBlock('终端用户', Colors.green, onTap: (){
                // 打开终端用户页面
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EndUser(type: 'user'))
                );
              }),
              roleBlock('安装商', Colors.orange, onTap: (){
                // 打开安装商页面
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Installer(type: 'installer',))
                );
              }),
              roleBlock('代理商', Colors.blue, onTap: () async{
                int i = await chooseAgentDialog();
                if (i == 1 || i == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: switchPageRoute(context, i))
                  );
                }
              }),
            ],
          ),
        )
      ),
    );
  }
  Widget roleBlock(String label, Color color, {Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff3390ff)),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, textScaleFactor: 1.5,),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 35.0,
              height: 5.0,
              color:color
            )
          ]
        ),
      ),
    );
  }
  Future <int> chooseAgentDialog () async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('选择类型'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 新建代理商
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('新建代理商'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 新建代理商
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('加入现有代理商'),
              ),
            )
          ]
        );
      }
    );
  }
  switchPageRoute (context, i) {
    if (i == 1) {
      return (context) => NewAgent(type: 'agent',);
    } else if (i == 2) {
      return (context) => JoinAgent(type: 'agent');
    } else {
      return null;
    }
  }
}