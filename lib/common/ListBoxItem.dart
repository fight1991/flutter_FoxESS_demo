import "package:flutter/material.dart";
class ListBoxItem extends StatelessWidget {
  final Function onTap;
  final Widget headLeftIcon;
  final Widget headRightIcon;
  final Image mainImg;
  final String name;
  final String time;
  final String elec;
  final String power;
  ListBoxItem({
    Key key,
    @required this.onTap,
    this.headLeftIcon = const Text(''),
    this.headRightIcon = const Text(''),
    @required this.mainImg,
    this.name = '-',
    this.time = '--',
    this.elec = '0',
    this.power = '0',
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey[100],
      child: Card(
        margin: EdgeInsets.only(bottom: 10.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  headLeftIcon,
                  headRightIcon
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  mainImg,
                  SizedBox(height: 15.0,),
                  Text(name,style: TextStyle(color: Color(0xff749BBD)),),
                  SizedBox(height: 5.0,),
                  Text(time, style: TextStyle(fontSize: 12.0, color: Colors.black45),)
                ],
              ),
              Divider(color: Colors.black38,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("今日发电(kWh)", style: TextStyle(fontSize: 12.0, color: Color(0xff749BBD)),),
                      SizedBox(height: 5.0,),
                      Text(elec)
                    ],
                  ),
                  SizedBox(
                    width: 1.0,
                    height: 20.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("当前功率(kW)", style: TextStyle(fontSize: 12.0, color: Color(0xff749BBD))),
                      SizedBox(height: 5.0,),
                      Text(power)
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}