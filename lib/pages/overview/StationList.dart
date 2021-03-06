
import "package:flutter/material.dart";
import "package:hybridApp/dio/PlantApi.dart";
import "package:hybridApp/util/index.dart";
import 'package:hybridApp/common/ListBoxItem.dart';
import "package:hybridApp/common/MyIcons.dart";

Map<String, GlobalKey<_StationList>> childKey = {
  'key0': GlobalKey(),
  'key1': GlobalKey(),
  'key2': GlobalKey(),
  'key3': GlobalKey(),
};
class StationList extends StatefulWidget {
  final int status;
  StationList({this.status, Key key}):super(key: key);
  @override
  _StationList createState() => _StationList();
}

class _StationList extends State<StationList> with AutomaticKeepAliveClientMixin{
  var currentPage = 1;
  var pageSize = 10;
  int toBottom = 50;
  var total;
  bool isLoading = true;
  bool hasMore = true; // 当currentPage * pageSize >= total 没有数据了
  List plantList = [];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    print(widget.status);
    initList();
    _scrollController.addListener(() {
      var bottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
      if (bottom < toBottom) { // 到达底部50的位置开始请求
        print('开始请求了');
        pullLoad();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: initList,
      child: Container(
        color: Color(0xfff5f5f5),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            listBox()
          ],
        ),
      ),
    );
  }
  // 条目数
  Widget listBox() {
    return Expanded(
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        children: [
          ...plantList.map((v) =>listBoxItem(v)).toList(),
          Center(
            child: Text(hasMore ? '上拉加载更多': '没有更多数据了',style: TextStyle(color: Colors.black54,fontSize: 12.0),)
          )
        ],
      ),
    );
  }
  Widget listBoxItem (Map<String,dynamic> obj) {
    return ListBoxItem(
      name: obj['name'],
      time: obj['createdDate'],
      elec: Util.setDataAbs(obj['generationToday']),
      power: Util.setDataAbs(obj['power']),
      mainImg: Image(
        image: AssetImage("images/pv_icon.png"),
        width: 70.0,
        fit: BoxFit.cover
      ),
      headLeftIcon: statusIcon(obj['status']),
      headRightIcon: IconButton(
        splashColor: Colors.grey[100],
        icon: Icon(MyIcons.more, color: Color(0xff3390ff),),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.topCenter,
        onPressed: () async{
          var opType = await showStationEditDialog(obj['name']);
          if (opType == 1) {
            print(1); // 编辑操作
            Navigator.of(context).pushNamed('/addStation', arguments: 'edit');
          } else {
            print(2); // 删除操作
          }
        }
      ),
      onTap: () {
        Navigator.pushNamed(context, '/stationTab', arguments: obj['stationID']);
      },
    );
  }
  // 电站编辑确认框
  Future<int> showStationEditDialog (String name) {
    return showDialog<int> (
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          titlePadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          title: Text(name,textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 22.0),),
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
        );
      }
    );
  }
  // 初始化电站列表
  Future initList ([name]) async {
    currentPage = 1;
    isLoading = true;
    var temp = await getList(name);
    setState(() {
      plantList = temp as List;
    });
  }
  // 上拉加载
  void pullLoad () async{
    if (!hasMore || isLoading) return;
    var temp = await getList();
    setState(() {
      plantList = [...plantList, ...temp];
    });
  }
  // 获取电站列表
  getList ([name]) async {
    var res = await PlantApi.getPlantList({
      'currentPage': currentPage,
      'pageSize': pageSize,
      'condition': {
        'status': widget.status,
        'name': name ?? ''
      }
    });
    if (null != res) {
      setState(() {
        hasMore = res['currentPage'] * res['pageSize'] < res['total'];
        isLoading = false;
      });
      return res['plants'];
    } else {
      return [];
    }
  }
  statusIcon (int status) {
    // 1正常 2异常 3离线
    switch (status) {
      case 1:
        return Icon(MyIcons.success, color: Colors.green,);
      case 2: 
        return Icon(MyIcons.abnormal, color: Colors.red,);
      default:
        return Icon(MyIcons.offline, color: Colors.black54,);
    }
  }
}