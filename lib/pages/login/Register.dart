import "package:flutter/material.dart";
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white), // 单选框颜色
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text('用户名', style: TextStyle(color: Colors.white),),
                Container(
                  constraints: BoxConstraints(maxHeight: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffCBDBEF),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  )
                )
              ]
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text('邮箱', style: TextStyle(color: Colors.white),),
                Container(
                  constraints: BoxConstraints(maxHeight: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffCBDBEF),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  )
                )
              ]
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text('密码', style: TextStyle(color: Colors.white),),
                Container(
                  constraints: BoxConstraints(maxHeight: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffCBDBEF),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  )
                )
              ]
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text('确认密码', style: TextStyle(color: Colors.white),),
                Container(
                  constraints: BoxConstraints(maxHeight: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffCBDBEF),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  )
                )
              ]
            )
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