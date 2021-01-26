
import 'dart:convert';
import './Fetch.dart';
import '../models/user.dart';
class UserApi {
  static Future<User> login(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/login',
      data: data
    );
    var resp = json.decode(res.toString());
    return User.fromJson(resp);
  }
  static Future<dynamic> register(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/register',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  static Future<dynamic> restPw(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/register',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  static Future<dynamic> getCode(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/register',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
  static Future<dynamic> logOut(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/logout',
      data: data
    );
    var resp = json.decode(res.toString());
    return resp;
  }
}