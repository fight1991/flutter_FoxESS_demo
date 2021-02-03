import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import "./DioInit.dart";
class Fetch {
  // get请求封装
  static Future get ({ path, data = const <String, dynamic>{}, loading = true }) async{
    try {
      if (loading) startLoading();
      Response res = await DioInit.dio.get(path, queryParameters: data);
      if (loading) closeLoading();
      return res;
    } catch (e) {
      print(e);
      if (loading) closeLoading();
    }
  }
  // post请求封装
  static Future post ({ path, data = const <String, dynamic>{}, loading = true }) async{
    try {
      if (loading) startLoading();
      Response res = await DioInit.dio.post(path, data: data);
      if (loading) closeLoading();
      return res;
    } catch (e) {
      print(e);
      if (loading) closeLoading();
    }
  }
  // 多个并发请求
  static Future all ({ loading = true, List<Future> futures}) async{
    try {
      if (loading) startLoading();
      var res = await Future.wait(futures);
      if (loading) closeLoading();
      return res;
    } catch (e) {
      if (loading) closeLoading();
    }
  }
}
// 开启loading
void startLoading () {
  EasyLoading.instance
    ..maskColor = Colors.transparent
    ..indicatorType = EasyLoadingIndicatorType.threeBounce;
  EasyLoading.show(
    status: 'loading...',
    maskType: EasyLoadingMaskType.custom,
  );
}
// 关闭loading
void closeLoading () {
  EasyLoading.dismiss();
}