import "./DioInit.dart";
class Fetch {
  static Future get ({ path, data }) {
    return DioInit.dio.get(path, queryParameters: data);
  }
  static Future post ({ path, data }) {
    return DioInit.dio.post(path, data: data);
  }
}