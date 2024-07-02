import 'package:architecture/core/networking/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>(
  (ref) {
    final Dio dio = Dio();
    return DioClient(dio: dio);
  },
);
