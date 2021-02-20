import 'dart:convert';
import './Fetch.dart';

class PlantApi {
  // 所有电站状态
  static Future<dynamic> status() async {
    var res = await Fetch.get(
      path: '/c/v0/plant/status/all',
      loading: false
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 发电情况及收益
  static Future<dynamic> earnings() async {
    var res = await Fetch.get(
      path: '/c/v0/plant/earnings/all',
      loading: false
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 电站状态及发电情况并发请求
  static Future<dynamic> all (loading) async{
    List urlList = ['/c/v0/plant/earnings/all', '/c/v0/plant/status/all'];
    List<Future> params = urlList.map((v) => Fetch.get(path: v, loading: false)).toList();
    var res = await Fetch.all(
      futures: params,
      loading: loading
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 获取电站列表
  static Future<dynamic> getPlantList(data) async {
    var res = await Fetch.post(
      path: '/c/v0/plant/list',
      data: data
    );
    var resp = json.decode(res.toString());
    if (resp['errno'] == 0) {
      return resp['result'];
    } else {
      return null;
    }
  }
  // 删除电站
  static Future<dynamic> plantDelete(data) async {
    var res = await Fetch.post(
      path: '/c/v0/plant/delete',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 终端用户未关联电站时41934 创建电站
  static Future<dynamic> newPlantByEndUser(data) async {
    var res = await Fetch.post(
      path: '/c/v1/plant/create',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 创建电站
  static Future<bool> newPlant(data) async {
    var res = await Fetch.post(
      path: '/c/v0/plant/create',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp['errno'] == 0;
  }
  // 编辑电站
  static Future<dynamic> plantEdit(data) async {
    var res = await Fetch.post(
      path: '/c/v0/plant/update',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 电站详情
  static Future<dynamic> plantDetail(data) async {
    var res = await Fetch.get(
      path: '/c/v0/plant/get',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 单个电站收益详情
  static Future<dynamic> plantEarning() async {
    var res = await Fetch.get(
      path: '/c/v0/plant/earnings/detail',
    );
    var resp = json.decode(res.toString());
    return resp;
  }
}