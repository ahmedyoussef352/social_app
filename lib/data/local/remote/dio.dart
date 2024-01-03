import 'package:dio/dio.dart';
import 'package:fashiontik/core/config/end_points.dart';

// Dio dio() {
//   Dio dio = Dio();

//   dio.options.baseUrl = "http://127.0.0.1:8000/api";
//   // dio.options.headers["Accept"] = "application/json";
//   return dio;
// }

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: EndPoint.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {"Accept": "application/json"}),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> getdata(
      {required String url, Map<String, dynamic>? qure, token}) async {
    dio.options.headers = {
      // 'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(url, queryParameters: qure);
  }

  // static Future<Response?> getData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   Map<String, dynamic>? data,
  // }) async {
  //   return await dio!.get(url, queryParameters: query, data: data);
  // }
}
