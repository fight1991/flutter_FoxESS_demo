import "package:flutter/material.dart";
class My extends StatefulWidget {
  @override
  _My createState() => _My();
}
class _My extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        elevation: 10.0,
        centerTitle: true,
        leading: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 15.0),
        child: Column(
          children: <Widget>[
            listItem('用户名', 'agent1221'),
            listItem('用户类型', '代理商'),
            listItem('软件版本', 'V3.0.2'),
            listItem('代理商/安装商代码', 'f121233'),
            listItem('点击获取邀请码', '', (){print('点击了');}),
            logoutBtn()
          ],
        ),
      ),
    );
  }
  // 条目数
  Widget listItem (String label, String value, [Function callback]) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xff3390ff)))),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          callback == null ? Text(label) : InkWell(child: Text(label), onTap: callback,),
          Text(value),
        ],
      ),
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
}