
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
}