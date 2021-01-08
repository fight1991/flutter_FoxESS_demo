
import "package:flutter/material.dart";
import "../../common/MyIcons.dart";
import "../../common/ListBoxItem.dart";
class DeviceList extends StatefulWidget {
  final type;
  DeviceList({this.type});
  @override
  _DeviceList createState() => _DeviceList();
}

class _DeviceList extends State<DeviceList> {
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
        image: AssetImage("images/inverter.png"),
        width: 70.0,
        fit: BoxFit.cover
      ),
      headLeftIcon: Icon(MyIcons.success, color: Colors.green,),
      headRightIcon: IconButton(
        splashColor: Colors.grey[100],
        icon: Icon(MyIcons.remote_setting, color: Color(0xff3390ff),),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.topCenter,
        onPressed: () {
          print('跳转到远程设置');
        }
      ),
      onTap: () {
        Navigator.pushNamed(context, '/stationTab', arguments: id);
      },
    );
  }
}