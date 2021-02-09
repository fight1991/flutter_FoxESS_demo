// 主题颜色
import 'package:flutter/material.dart';
import 'package:hybridApp/models/cacheConfig.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hybridApp/models/profile.dart';
import 'package:hybridApp/dio/DioInit.dart';
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];

class Global {
  // 本地化存储
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  // 想要直接在任何地方都能跳转到某一个页面，那个我们首先要创建一个全局的GlobalKey
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // 网络缓存对象
  // static NetCache netCache = NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 构建版本
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  // 初始化全局信息, 会在APP启动时执行
  
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString('profile');
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }

    // 如果没有缓存策略, 设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    // 初始化网路请求相关配置
    DioInit.init();
  }
  // 持久化Profile信息
  static saveProfile() => 
    _prefs.setString('profile', jsonEncode(profile.toJson()));

}