import "dart:convert" as convert;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
class Util {
  // base64加密
  static String base64Encode(String data) {
    var bytes = convert.utf8.encode(data);
    return convert.base64Encode(bytes);
  }
  // base64解密
  static String base64Decode(String data) {
    List<int> bytes = convert.base64Decode(data);
    return convert.utf8.decode(bytes);
  }
  // md5加密
  static String md5Encode(String data) {
    var content = convert.utf8.encode(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
  // 保留2位有效数字,并取绝对值
  static setDataAbs(data) {
    return data.abs().toStringAsFixed(2);
  }
}