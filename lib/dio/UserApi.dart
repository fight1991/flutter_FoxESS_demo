
import 'dart:convert';
import './Fetch.dart';
import '../models/user.dart';
class UserApi {
  // 用户登录
  static Future<User> login(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/login',
      data: data
    );
    var resp = json.decode(res.toString());
    return User.fromJson(resp['result']);
  }
  // 用户注册
  static Future<bool> register(data) async {
    var res = await Fetch.post(
      path: '/c/v1/user/register',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp['errno'] == 0;
  }
  // 用户重置密码
  static Future<bool> restPw(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/reset',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp['errno'] == 0;
  }
  // 获取验证码
  static Future<dynamic> getCode(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/sendcaptcha',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  // 用户注销登录
  static Future<bool> logOut([data]) async {
    var res = await Fetch.post(
      path: '/c/v0/user/logout',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp['errno'] == 0;
  }
  // 终端用户,安装商, 代理商关联
  static Future<bool> joinOrgans([data]) async {
    var res = await Fetch.post(
      path: '/c/v0/organs/join',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp['errno'] == 0;
  }
  // 获取代理商/安装商的组织代码 和代理商邀请码
  static Future<dynamic> getOrganCode(data) async {
    var res = await Fetch.get(
      path: '/c/v0/organs/invitation',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp['result'];
  }
}