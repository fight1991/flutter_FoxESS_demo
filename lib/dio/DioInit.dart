
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../common/Global.dart';

class DioInit {
  BuildContext context;
  // Options _options;
  DioInit([this.context]) {
    // _options = Options(extra: {"context": context});
  }
  static BaseOptions options = BaseOptions(
    baseUrl: "https://www.maitian-yun.com",
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );
  static Dio dio = Dio(options);
  
  static void init() {
    //Fiddler抓包设置代理
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.findProxy = (url){
        return "PROXY 192.168.4.104:8866";
      };
      //抓Https包设置
      client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    };
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (Options options) async{
        EasyLoading.instance
          ..maskColor = Colors.transparent
          ..indicatorType = EasyLoadingIndicatorType.threeBounce;
        EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.custom,
        );
        //...If no token, request token firstly.
        // Response response = await dio.get("/token");
        //Set the token to headers
        options.headers["token"] = Global.profile.user.token;
        options.headers["lang"] = 'zh_CN';
        return options; //continue
      },
      onResponse: (Response response) async{
        var resp = response.data;
        if (resp['errno'] != 0) {
          Fluttertoast.showToast(
            msg: "错误码${resp['errno']}",
            backgroundColor: Colors.black45
          );
        }
        EasyLoading.dismiss();
        return resp;
      },
      onError: (DioError err) {
        EasyLoading.dismiss();
      }
    ));
  }
  
}