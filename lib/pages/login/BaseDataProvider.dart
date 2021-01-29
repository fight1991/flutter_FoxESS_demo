import "package:flutter/material.dart";
class BaseData extends ChangeNotifier {
  Map<String, String> _baseForm = {
    'account': '', // 用户名
    'password': '', // 密码
    'email': ''
  };
  Map get baseForm => _baseForm;
  void saveBaseForm (String key, String value) {
    _baseForm[key] = value;
    notifyListeners();
  }
}