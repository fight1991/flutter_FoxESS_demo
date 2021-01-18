import "package:flutter/material.dart";
import "package:flutter/services.dart";
class ForgetPw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              Text('验证码', style: TextStyle(color: Colors.white),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xffCBDBEF),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 30.0),
                      width: 40.0,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly, // 只能是数字
                          LengthLimitingTextInputFormatter(4) // 限制长度
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      )
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 30.0),
                      margin: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff3390FF), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(14.0))
                      ),
                      child: FlatButton(
                        onPressed: () {print('哈哈');},
                        child: Text('Send verification code', style: TextStyle(color: Color(0xff3390FF))),
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                      )
                    )
                  ],
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
    );
  }
}