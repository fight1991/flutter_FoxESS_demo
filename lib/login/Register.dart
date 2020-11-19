import "package:flutter/material.dart";
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text('USER NAME', style: TextStyle(color: Colors.white),),
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
                Text('MAILBOX', style: TextStyle(color: Colors.white),),
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
                Text('PASSWORD', style: TextStyle(color: Colors.white),),
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
                Text('CONFIRM PASSWORD', style: TextStyle(color: Colors.white),),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 20.0,
                height: 20.0,
                margin: EdgeInsets.only(right: 10.0),
                child: Checkbox(
                  checkColor: Colors.white,
                  value: false,
                  onChanged: (value) {}
                )
              ),
              Expanded(
                child: Text("I'have read and agreed to the user agreement",style: TextStyle(color: Colors.white),)
              )
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