import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
class Overview extends StatefulWidget {
  @override
  _Overview createState() => _Overview();
}
class _Overview extends State<Overview> {
  List<Map> nums = [
    { 'item': 'Total', 'num': 33},
    { 'item': 'Normal', 'num': 3},
    { 'item': 'Abnamal', 'num': 13},
    { 'item': 'Online', 'num': 5}
  ];
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
        child: SingleChildScrollView(
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
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SimpleListTile(
                      leading: Icon(Icons.settings, color: _appBarTextColor.color,),
                      title: Text('TOTAL ENERGY(kWh)'),
                      trailing: Text('233311.5',maxLines: 4, overflow: TextOverflow.ellipsis),
                    ),
                    SimpleListTile(
                      leading: Icon(Icons.settings, color: _appBarTextColor.color,),
                      title: Text('TOTAL ENERGY(kWh)'),
                      trailing: Text('2342.5'),
                    ),
                  ],
                ),
              ),
              Divider(color: _appBarTextColor.color, indent: 30.0, endIndent: 30.0,),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 350.0,
                height: 180.0,
                child: Swiper(
                  outer: true,
                  itemCount: nums.length,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.black26,
                      activeColor: _appBarTextColor.color,
                    )
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xffF6F6F6), Color(0xffE3E3E3)]),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(nums[index]['item'], style: TextStyle(fontSize: 32.0),),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(nums[index]['num'].toString(), style: TextStyle(fontSize: 56.0, color: Colors.white, shadows: [Shadow(color: Colors.black54, offset: Offset(2.0, 1.0))]),),
                          )
                        ],
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
class SimpleListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  SimpleListTile({
    Key key,
    this.leading,
    this.title,
    this.trailing
  }): super(key: key);
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              leading,
              SizedBox(width: 10.0,),
              title
            ],
          ),
          Container(child: trailing, width: 90.0,)
        ],
      )
    );
  }
}