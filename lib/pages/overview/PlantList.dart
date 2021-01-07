
import "package:flutter/material.dart";
import "../../common/ListBoxItem.dart";
class PlantList extends StatefulWidget {
  final type;
  PlantList({this.type});
  @override
  _PlantList createState() => _PlantList();
}

class _PlantList extends State<PlantList> {
  @override
  Widget build(BuildContext context) {
    print('传值过来了``````');
    print(widget.type);
    return Container(
      color: Color(0xfff5f5f5),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
          return listBoxItem(index.toString());
        }
      )
    );
  }
  Widget listBoxItem (String id) {
    return ListBoxItem(
      name: 'wuxihahah lala',
      time: '2010/11/24 03:39',
      elec: '1212.33',
      power: '444.88',
      mainImg: Image(
        image: AssetImage("images/pv_icon.png"),
        width: 70.0,
        fit: BoxFit.cover
      ),
      headLeftIcon: Icon(Icons.restore),
      headRightIcon: IconButton(
        splashColor: Colors.grey[100],
        icon: Icon(Icons.more_horiz),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        onPressed: () async{
          var opType = await showStationEditDialog(id);
          if (opType == 1) {
            print(1); // 编辑操作
            Navigator.of(context).pushNamed('/addStation', arguments: 'edit');
          } else {
            print(2); // 删除操作
          }
        }
      ),
      onTap: () {
        Navigator.pushNamed(context, '/stationTab', arguments: id);
      },
    );
  }
  // 电站编辑确认框
  Future<int> showStationEditDialog (String sn) {
    return showDialog<int> (
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          titlePadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          title: Text(sn,textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 22.0),),
          content: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {Navigator.pop(context, 1);},
                  child: Text('编辑',style: TextStyle(color: Color(0xff3390ff), fontSize: 22.0))
                ),
                SizedBox(
                  width: 1.0,
                  height: 20.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
                FlatButton(
                  onPressed: () {Navigator.pop(context, 2);},
                  child: Text('删除', style: TextStyle(color: Colors.red, fontSize: 22.0),)
                ),
              ],
            ),
          )
          // actions: <Widget>[
          //   FlatButton(
          //     onPressed: () {Navigator.pop(context, 1);},
          //     child: Text('编辑')
          //   ),
          //   FlatButton(
          //     onPressed: () {Navigator.pop(context, 2);},
          //     child: Text('删除', style: TextStyle(color: Colors.red),)
          //   ),
          // ],
        );
      }
    );
  }
}