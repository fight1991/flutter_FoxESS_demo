import "package:flutter/material.dart";
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white), // 单选框颜色
      child: Column(
        children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: '用户名',
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: '邮箱',
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: '密码',
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: '确认密码',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0, right:5.0),
                width: 20.0,
                height: 20.0,
                child: Checkbox(
                  checkColor: Colors.white,
                  value: false,
                  onChanged: (value) {}
                ),
              ),
              Text("已阅读并同意用户协议",style: TextStyle(color: Colors.white, fontSize: 10.0),)
            ]
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top:10.0, right:20.0, bottom:10.0, left:20.0),
              margin: EdgeInsets.only(top: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Color(0xff94C5FF),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0)]
              ),
              child: Image(
                image: AssetImage("images/enter.png"),
                fit: BoxFit.cover,
                width: 35.0,
              )
            )
          )
        ],
      ),
    );
  }
}