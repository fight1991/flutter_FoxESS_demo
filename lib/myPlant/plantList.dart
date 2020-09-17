import "package:flutter/material.dart";
class PlantList extends StatelessWidget {
  PlantList({Key key, @required this.type}): super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 搜索框
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)
            )
          ),
        ),
        // Text('搜索框', style: Theme.of(context).textTheme.bodyText1,),
        // 列表自动高度自动撑满
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext cxt, int index) {
              return ListItem(temp: index);
            },
          )
        )
      ],
    );
  }
}
class ListItem extends StatelessWidget {
  ListItem({Key key, @required this.temp}) : super(key: key);
  final temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        // height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xff04558a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3.0),
            topRight: Radius.circular(3.0)
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/station.png"),
              height: 125.0,
            ),
            Expanded(
              child: Container(
                height: 110.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('实验室挂机', style: TextStyle(fontSize: 16.0, color: Colors.white),),
                        Icon(Icons.more_horiz, color: Colors.white, size: 20.0,)
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.trip_origin, color: Color(0xfff58700), size: 10.0,),
                              Text(' '),
                              Text('今日发电', style: TextStyle(color: Colors.white54)),
                            ],
                          )
                        ),
                        Expanded(
                          child: Text('0.00kWh', style: TextStyle(color: Color(0xfff58700)))
                        )
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.trip_origin, color: Color(0xff79bc77), size: 10.0,),
                              Text(' '),
                              Text('当前功率', style: TextStyle(color: Colors.white54)),
                            ],
                          )
                        ),
                        Expanded(
                          child: Text('0.00kWh', style: TextStyle(color: Color(0xff79bc77)))
                        )
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.timer, size: 10.0, color: Colors.white54),
                              Text(' '),
                              Text('统计时间', style: TextStyle(color: Colors.white54)),
                            ],
                          )
                        ),
                        Expanded(
                          child: Text('2020/09/17 11:33', style: TextStyle(color: Colors.white54))
                        )
                      ]
                    ),
                  ],
                )
              )
            )
          ]
        )
      )
    );
  }
}
