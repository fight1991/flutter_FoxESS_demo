import 'dart:convert';
import './Fetch.dart';
class PlantApi {
  // 所有电站状态
  static Future<dynamic> status([data]) async {
    var res = await Fetch.get(
      path: '/c/v0/plant/status/all',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 发电情况及收益
  static Future<dynamic> earnings([data]) async {
    var res = await Fetch.get(
      path: '/c/v0/plant/earnings/all',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
}