import './Fetch.dart';
import 'dart:convert';
import '../models/user.dart';
class UserApi {
  Future<User> login(data) async {
    var res = await Fetch.post(
      path: '/c/v0/user/login',
      data: data
    );
    var temp = jsonDecode(res.toString());
    return User.fromJson(temp);
  }
}