import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(Options options) async{
        //...If no token, request token firstly.
        // Response response = await dio.get("/token");
        //Set the token to headers
        options.headers["token"] = Global.profile.token;
        options.headers["lang"] = Global.profile.locale;
        return options; //continue
      }
    ));
  }
  
}