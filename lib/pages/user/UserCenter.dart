import "package:flutter/material.dart";
import "../../common/MyIcons.dart";
class UserCenter extends StatefulWidget {
  @override
  _UserCenter createState() => _UserCenter();
}
class _UserCenter extends State<UserCenter> {
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
                child: Text('张三', style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              accountEmail: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('11212@12.com'),
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
                        Navigator.of(context).pushNamed('/userInfo');
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    color: Colors.white,
                    child: ListTile(
                      title: Text('退出', style: TextStyle(color: Colors.black)),
                      leading: Icon(MyIcons.close, size: 40.0, color: Colors.red,),
                      onTap: () {
                        
                      },
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      )
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 15.0),
      //   child: Column(
      //     children: <Widget>[
      //       listItem('用户名', 'agent1221'),
      //       listItem('用户类型', '代理商'),
      //       listItem('软件版本', 'V3.0.2'),
      //       listItem('代理商/安装商代码', 'f121233'),
      //       listItem('点击获取邀请码', '', (){print('点击了');}),
      //       logoutBtn()
      //     ],
      //   ),
      // ),
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