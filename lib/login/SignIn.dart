import "package:flutter/material.dart";
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('ACCOUNT', style: TextStyle(color: Colors.white)),
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
              ),
            ),
          ]
        ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('PASSWORD', style: TextStyle(color: Colors.white)),
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
                ),
              ),
            ]
          ),
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