import "package:flutter/material.dart";
class UserInfo extends StatefulWidget {
  @override
  _UserInfo createState() => _UserInfo();
}
class _UserInfo extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的信息'),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            listItem('用户名', 'agent1221'),
            listItem('用户类型', '代理商'),
            listItem('软件版本', 'V3.0.2'),
            listItem('代理商/安装商代码', 'f121233'),
            listItem('点击获取邀请码', '', (){print('点击了');}),
          ]
        ),
      )
    );
  }
// 条目数
  Widget listItem (String label, String value, [Function callback]) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          callback == null ? Text(label, style: TextStyle(color: Colors.black),) : InkWell(child: Text(label, style: TextStyle(color: Colors.black)), onTap: callback,),
          Text(value, style: TextStyle(color: Colors.black)),
        ],
      )
    );
  }
}