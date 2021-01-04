import "package:flutter/material.dart";
class TabPage extends StatefulWidget {
  final type;
  TabPage({this.type});
  @override
  _TabPage createState() => _TabPage();
}

class _TabPage extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    print('传值过来了``````');
    print(widget.type);
    return Container(
      color: Color(0xfff5f5f5),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          searchInput(),
          listBox()
        ],
      ),
    );
  }
  // 搜索框
  Widget searchInput () {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        // boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0,1.0), spreadRadius: 2.0, blurRadius: 2.0)],
        color: Colors.white
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black45,),
          hintText: '查找'
        ),
      ),
    );
  }
  // 条目数
  Widget listBox() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return listBoxItem();
        }
      )
    );
  }
  Widget listBoxItem () {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.restore),
                Icon(Icons.more_horiz)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("images/pv_icon.png"), width: 70.0, fit: BoxFit.cover,),
                SizedBox(height: 15.0,),
                Text('wuxihahah lala',style: TextStyle(color: Color(0xff749BBD)),),
                SizedBox(height: 5.0,),
                Text('2010/11/24 03:39', style: TextStyle(fontSize: 12.0, color: Colors.black45),)
              ],
            ),
            Divider(color: Colors.black38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Today's energy(kWh)", style: TextStyle(fontSize: 12.0, color: Color(0xff749BBD)),),
                    SizedBox(height: 5.0,),
                    Text('121.3')
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
                    Text("Power now(kW)", style: TextStyle(fontSize: 12.0, color: Color(0xff749BBD))),
                    SizedBox(height: 5.0,),
                    Text('12121221.3')
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}