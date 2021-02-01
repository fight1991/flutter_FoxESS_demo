import "package:flutter/material.dart";
class UserInfo extends StatefulWidget {
  @override
  _UserInfo createState() => _UserInfo();
}
class _UserInfo extends State<UserInfo> {
  int access;
  @override
  void initState() {
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
          children: listInfo(userInfo)
        ),
      )
    );
  }
// 条目数
  Widget listItem (String label, Widget value, [Function callback]) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: Colors.grey))),
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          callback == null ? Text(label) : InkWell(child: Text(label), onTap: callback,),
          value,
        ],
      )
    );
  }
  List<Widget> listInfo (userInfo) {
    switch (userInfo['access']) {
      case 1:
        return [
          listItem('用户名', Text(userInfo['name'])),
          listItem('用户类型', Text(userInfo['roleName'])),
          listItem('关联代理商/安装商', Icon(Icons.keyboard_arrow_right)),
        ];
      case 2:
        return [
          listItem('用户名', Text(userInfo['name'])),
          listItem('用户类型', Text(userInfo['roleName'])),
          listItem('关联代理商/安装商', Icon(Icons.keyboard_arrow_right)),
        ];
      case 3:
        return [
          listItem('用户名', Text(userInfo['name'])),
          listItem('用户类型', Text(userInfo['roleName'])),
          listItem('关联代理商/安装商', Icon(Icons.keyboard_arrow_right)),
        ];
      default:
        return [Container()];
    }
  }
}