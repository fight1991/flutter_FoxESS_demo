import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_picker/flutter_picker.dart';
import "package:hybridApp/dio/PlantApi.dart";

class AddStation extends StatefulWidget {
  final opType;
  AddStation({ Key key, this.opType}):super(key: key);
  @override
  _AddStation createState() => _AddStation();
}

class _AddStation extends State<AddStation> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  List<Map<String, dynamic>> _deviceList = [{'sn': '009W2E31A6VA044'}];
  TextEditingController _addSnController = TextEditingController();
  Map<String, dynamic> _details = {}; 
  List plantTypeList = [1, 2];
  int plantTypeValue;
  TextEditingController _plantTypeController = TextEditingController();
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
              onTap: () async{
                // 提交电站信息
                // bool res = await PlantApi.newPlant({
                //   'devices': _deviceList,
                //   'details': _details,
                //   'timezone': '',
                //   'daylight': '',
                //   'agent': '',
                //   'position': {
                //     'format': 'dms',
                //     'x': '',
                //     'y': '',
                //     'pid': ''
                //   }
                // });
                // if (res) {
                //   Fluttertoast.showToast(msg: '创建成功');
                // }
              },
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            stationBaseTitle('电站基础信息'),
            formInfo(),
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
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color:Colors.grey[400])),
        color: Colors.white
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
  Widget formInfo () {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            formItemInput('电站名称', 'name'),
            formItemSelect('电站类型', 'type', _plantTypeController, plantTypeValue, (){
              showPickerModal(context);
            }),
            formItemInput('系统组件容量', 'systemCapacity'),
            formItemInput('国家/地区', 'country'),
            formItemInput('城市', 'city'),
            formItemInput('地址', 'address'),
            formItemInput('邮编', 'postcode'),
            formItemInput('代理商', 'agent'),
            formItemInput('时区', 'timezone'),
            formItemInput('夏令时时区', 'daylight'),
          ],
        ),
      ),
    );
  }
  // 选择框
  Widget formItemSelect (label, key, controller, value, [onTap]) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children:[
          Row(
            children: <Widget>[
              Text('*', style: TextStyle(color: Colors.red),),
              Text(label,)
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(4.0)
            ),
            height: 30.0,
            margin: EdgeInsets.only(top: 4.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
            // textAlign: TextAlign.end,
              readOnly: true,
              controller: controller,
              onTap: onTap,
              decoration: InputDecoration(
                isDense: true,
                // 注意 prefix / prefixText获取焦点是才显示
                // Text.rich(TextSpan(children: [
                //   TextSpan(text: "*", style: TextStyle(color: Colors.red)),
                //   TextSpan(text: "电站名称", style: TextStyle(color: Color(0xffA7B8CC)))
                // ]))
                border: InputBorder.none,
              ),
              initialValue: _details[key],
              onSaved: (val){
                _details[key] = value;
              },
            )
          )
        ]
      ),
    );
  }
  // 输入框
  Widget formItemInput (label, key, [onTap]) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children:[
          Row(
            children: <Widget>[
              Text('*', style: TextStyle(color: Colors.red),),
              Text(label,)
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(4.0)
            ),
            height: 30.0,
            margin: EdgeInsets.only(top: 4.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
            // textAlign: TextAlign.end,
              onTap: onTap,
              decoration: InputDecoration(
                isDense: true,
                // 注意 prefix / prefixText获取焦点是才显示
                // Text.rich(TextSpan(children: [
                //   TextSpan(text: "*", style: TextStyle(color: Colors.red)),
                //   TextSpan(text: "电站名称", style: TextStyle(color: Color(0xffA7B8CC)))
                // ]))
                border: InputBorder.none,
              ),
              initialValue: _details[key],
              onSaved: (val){
                _details[key] = val;
              },
            )
          )
        ]
      ),
    );
  }
  // 电站设备列表头部区域
  Widget deviceListTile (title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffA7B8CC))),
        color: Colors.white
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
                      _deviceList.add({'sn':_addSnController.text});
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
  Widget deviceContainer(List<Map<String,dynamic>> list) {
    return Column(
      children: list.map((i) => deviceListItem(i)).toList()
    );
  }
  // 设备列表子项
  Widget deviceListItem (Map<String,dynamic> snObj) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffA7B8CC))),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(snObj['sn'].toString()),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.grey[600],),
            onPressed: (){
              setState(() {
                _deviceList.remove(snObj);
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
  // 电站类型picker
   showPickerModal(BuildContext context) {
      new Picker(
        confirmText: '确定',
        cancelText: '取消',
        adapter: PickerDataAdapter<String>(pickerdata: ['光伏电站','储能电站']),
        changeToFirst: true,
        itemExtent: 50.0,
        hideHeader: false,
        onConfirm: (Picker picker, List value) {
          print(value[0].toString());
          print(picker.adapter.text);
          var index = value[0];
          setState(() {
            plantTypeValue = plantTypeList[index];
            _plantTypeController.text = picker.adapter.text[0];
          });
        }
      ).showModal(this.context); //_scaffoldKey.currentState);
    }
}