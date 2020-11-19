import "package:flutter/material.dart";
class Overview extends StatefulWidget {
  @override
  _Overview createState() => _Overview();
}
class _Overview extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    TextStyle _appBarTextColor = Theme.of(context).textTheme.bodyText2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Overview', style: _appBarTextColor),
        centerTitle: true,
        backgroundColor: Color(0xfff6f6f6),
        leading: Icon(Icons.arrow_back_ios, color: _appBarTextColor.color,),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.location_on, color: _appBarTextColor.color,),
          )
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 260.0,
              decoration: BoxDecoration(
                color: Color(0xfff6f6f6),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(130.0)),
                boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(-2.0, 0.0), blurRadius: 12.0, spreadRadius: 0.0)]
              ),
              child: Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12.0)]
                  ),
                  child: Stack(
                    alignment:Alignment.center,
                    children:  <Widget>[
                      CircleAvatar(
                        radius: 75.0,
                        backgroundColor: Colors.black26,
                      ),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundColor: Colors.white,
                        child: Center(child: Text('69.60', style: TextStyle(fontSize: 30.0),),),
                      ),
                      SizedBox(
                        height: 175,
                        width: 175,
                        child: CircularProgressIndicator(
                          strokeWidth: 15.0,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          value: .7,
                        ),
                      ),
                    ]
                  ),
                )
              ),
            )
          ],
        ),
      )
    );
  }
}