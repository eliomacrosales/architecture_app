import 'package:architecture/config/environment/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  late Dio dio;

  DioClient({Dio? dio}) {
    this.dio = dio ?? Dio();
    _configureHttpClient(baseUrl: Environment.baseUrlKeycloak);
  }
  Map<String, Object> get headers => {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Type': 'application/json',
    'Accept': 'application/json; charset=UTF-8',
    'Accept-Language': 'es',
  };

  void updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
      dio.options.headers = header;
  }

  void updateBaseURL(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }

  _configureHttpClient({required String baseUrl}) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.get('token');
    dio.options = BaseOptions(
      baseUrl: baseUrl ,
        headers  : {
          'Content-Type': 'application/x-www-form-urlencoded',
         // 'Content-Type': 'application/json',
         'Accept': 'application/json; charset=UTF-8',
          // 'Accept-Language': 'es',
          // 'Authorization': token as String
        },
      // receiveTimeout: const Duration(milliseconds: 5000),
      // sendTimeout: const Duration(milliseconds: 5000),
      // connectTimeout: const Duration(milliseconds: 5000),
    );
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (o) {
          if (kDebugMode) {
            debugPrint(o.toString());
          }
        }));
    return dio;
  }
}
