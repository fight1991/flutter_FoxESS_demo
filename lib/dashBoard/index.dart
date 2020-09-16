import "package:flutter/material.dart";
class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('总览'),
        centerTitle: true,
        actions: <Widget>[Container(child: Icon(Icons.location_on), padding: EdgeInsets.only(right:10.0))],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(0,67,107,1), Color.fromRGBO(2,36,59,1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:30, bottom:30),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width:1, color: Colors.white60))),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(  
                    child: Column(children: <Widget>[
                      Text('7', style: TextStyle(fontSize: 40, color: Color.fromRGBO(0,137,202, 1), fontWeight:FontWeight.w700),),
                      Text('全部', style: TextStyle(color: Colors.white, fontSize: 14))],
                    ),
                    flex: 1
                  ),
                  Expanded(  
                    child: Column(children: <Widget>[
                      Text('0', style: TextStyle(fontSize: 40, color: Color.fromRGBO(129,191,64, 1), fontWeight:FontWeight.w700),),
                      Text('正常', style: TextStyle(color: Colors.white, fontSize: 14))],
                    ),
                    flex: 1
                  ),
                  Expanded(  
                    child: Column(children: <Widget>[
                      Text('0', style: TextStyle(fontSize: 40, color: Color.fromRGBO(244,135,0, 1), fontWeight:FontWeight.w700),),
                      Text('异常', style: TextStyle(color: Colors.white, fontSize: 14))],
                    ),
                    flex: 1
                  ),
                  Expanded(  
                    child: Column(children: <Widget>[
                      Text('7', style: TextStyle(fontSize: 40, color: Color.fromRGBO(150,29,154, 1), fontWeight:FontWeight.w700),),
                      Text('离线', style: TextStyle(color: Colors.white, fontSize: 14))],
                    ),
                    flex: 1
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        child: Transform.translate(
                          offset: Offset(-15.0, 5.0),
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [Color.fromRGBO(2,127,193, .6), Color.fromRGBO(41,145,198, .6)],
                                center: Alignment(0, 0),
                                stops: [0.7, 1.0]
                              )
                            )
                          ),
                        )
                      ),
                      Positioned(
                        right: 10,
                        child: Container(
                          width: 160,
                          height: 160,
                          child: Center(
                            child: Text('0.00', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700),),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [Color.fromRGBO(2,127,193, .8), Color.fromRGBO(41,145,198, .8)],
                              center: Alignment(0, 0),
                              stops: [0.7, 1.0]
                            )
                          )
                          // color: Color.fromRGBO(0, 0, 0, 0.5),
                        )
                      ),
                      
                    ]
                  )
                  
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.white60))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                              Icon(Icons.attach_money, color: Color.fromRGBO(244,135,0, 1)),
                              Text('今日收益', style: TextStyle(color: Colors.white60),)
                            ],),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 14, bottom: 14),
                              child: Text('\$0.00', style: TextStyle(color: Color.fromRGBO(244,135,0, 1), fontSize: 20, fontWeight: FontWeight.w600),)
                            )
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.white60))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                              Icon(Icons.attach_money, color: Color.fromRGBO(244,135,0, 1)),
                              Text('累计发电', style: TextStyle(color: Colors.white60),)
                            ],),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 14, bottom: 14),
                              child: Text('\$0.00', style: TextStyle(color: Color.fromRGBO(244,135,0, 1), fontSize: 20, fontWeight: FontWeight.w600),)
                            )
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.white60))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                              Icon(Icons.attach_money, color: Color.fromRGBO(244,135,0, 1)),
                              Text('累计收益', style: TextStyle(color: Colors.white60),)
                            ],),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 14, bottom: 14),
                              child: Text('\$0.00', style: TextStyle(color: Color.fromRGBO(244,135,0, 1), fontSize: 20, fontWeight: FontWeight.w600),)
                            )
                          ]
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                              Icon(Icons.attach_money, color: Color.fromRGBO(244,135,0, 1)),
                              Text('系统容量', style: TextStyle(color: Colors.white60),)
                            ],),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 14, bottom: 14),
                              child: Text('\$0.00', style: TextStyle(color: Color.fromRGBO(244,135,0, 1), fontSize: 20, fontWeight: FontWeight.w600),)
                            )
                          ]
                        ),
                      ),
                    ],
                  )
                )
              ],)
            ),
          ],
        )
      ),
    );
  }
}