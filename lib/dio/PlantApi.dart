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
}