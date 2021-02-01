import "./DioInit.dart";
class Fetch {
  static Future get ({ path, data = const {} }) {
    return DioInit.dio.get(path, queryParameters: data);
  }
  static Future post ({ path, data = const {} }) {
    return DioInit.dio.post(path, data: data);
  }
}