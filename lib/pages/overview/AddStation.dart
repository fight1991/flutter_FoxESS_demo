import "package:flutter/material.dart";

class AddStation extends StatefulWidget {
  final opType;
  AddStation({ Key key, this.opType}):super(key: key);
  @override
  _AddStation createState() => _AddStation();
}

class _AddStation extends State<AddStation> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  List<String> _deviceList = ['1212', '123334'];
  TextEditingController _addSnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pageTitle = '新建电站';
    var args = ModalRoute.of(context).settings.arguments;
    if (args == 'edit') {
      pageTitle = '编辑电站';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('确定', style: TextStyle(fontSize: 20.0),)
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            stationBaseTitle('电站基础信息'),
            formInfo(_formKey),
            deviceListTile('设备列表'),
            deviceContainer(_deviceList),
          ]
        )
      ),
    );
  }
  // 电站基本信息头部
  Widget stationBaseTitle (title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color:Color(0xffA7B8CC)))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 8.0,
            height: 20.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xff3390ff),
                borderRadius: BorderRadius.vertical(top: Radius.circular(4.0), bottom: Radius.circular(4.0))
              )
            )
          ),
          SizedBox(width: 8.0),
          Text(title)
        ]
      ),
    );
  }
  // 表单信息
  Widget formInfo (GlobalKey formkey) {
    return Container(
      child: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            formInfoItem('电站名称'),
            formInfoItem('电站类型'),
            formInfoItem('国家/地区'),
            formInfoItem('城市'),
            formInfoItem('地址'),
            formInfoItem('电价'),
            formInfoItem('系统容量'),
            formInfoItem('邮编'),
            formInfoItem('代理商'),
            formInfoItem('时区'),
            formInfoItem('夏令时时区'),
          ],
        ),
      ),
    );
  }
  Widget formInfoItem (label) {
    return TextFormField(
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffA7B8CC))),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff3390ff))),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        // 注意 prefix / prefixText获取焦点是才显示
        // Text.rich(TextSpan(children: [
        //   TextSpan(text: "*", style: TextStyle(color: Colors.red)),
        //   TextSpan(text: "电站名称", style: TextStyle(color: Color(0xffA7B8CC)))
        // ]))
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('*', style: TextStyle(color: Colors.red),),
            Text(label, style: TextStyle(color: Color(0xffA7B8CC)),)
          ],
        )
      ),
    );
  }
  // 电站设备列表头部区域
  Widget deviceListTile (title) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffA7B8CC)))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            SizedBox(
              width: 8.0,
              height: 20.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xff3390ff),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4.0), bottom: Radius.circular(4.0))
                )
              )
            ),
            SizedBox(width: 8.0),
            Text(title)
          ],),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add, color: Color(0xff3390ff),),
                onPressed: ()async{
                  _addSnController.text = '';
                  bool isAdd = await showAddDeviceDialog();
                  if (isAdd) {
                    print('确认添加');
                    setState(() {
                      _deviceList.add(_addSnController.text);
                    });
                  } else {
                    print('取消添加');
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.camera_alt, color: Color(0xff3390ff),),
                onPressed: (){},
              )
            ]
          )
        ]
      ),
    );
  }
  // 设备列表容器
  Widget deviceContainer(List<String> list) {
    return Column(
      children: list.map((i) => deviceListItem(i)).toList()
    );
  }
  // 设备列表子项
  Widget deviceListItem (String sn) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffA7B8CC)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('SN: $sn'),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.grey[600],),
            onPressed: (){
              setState(() {
                _deviceList.remove(sn);
              });
            },
          )
        ],
      ),
    );
  }
  // 添加设备弹框
  Future<bool> showAddDeviceDialog () {
    return showDialog<bool> (
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('添加设备'),
          content: TextField(
            controller: _addSnController,
            decoration: InputDecoration(hintText: '设备SN'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              // 关闭对话框
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('确定'),
              // 关闭对话框并返回true
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      }
    );
  }
}