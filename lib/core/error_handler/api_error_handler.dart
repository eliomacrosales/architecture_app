import 'package:architecture/core/error_handler/app_exception.dart';
import 'package:dio/dio.dart';

mixin ApiErrorHandler {
  Future<T> executeApiCall<T>(Future<T> apiRequest, {bool login = false}) async {
    try {
      return await apiRequest;
    } on DioException catch (dioException) {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw AppException(dioException.message ?? 'Error Timeout');

        case DioExceptionType.badResponse:
          String errorMessage = 'badResponse';
          if (dioException.response != null && dioException.response!.data != null) {
            final data = dioException.response!.data;
            if (dioException.response!.statusCode == 401 && login) {
              throw AppException('Unauthorized');
            } else if (data is Map<String, dynamic> && data.containsKey('message')) {
              errorMessage = data['message'];
              throw AppException(errorMessage);
            }
          }
          throw AppException(errorMessage);

        case DioExceptionType.connectionError:
          throw AppException('Revise su conexión a internet');

        case DioExceptionType.unknown:
          throw AppException(dioException.message ?? 'Error desconocido');

        default:
          throw AppException(dioException.message ?? 'Error desconocido');
      }
    } catch (e) {
      throw AppException('Error desconocido');
    }
  }
}
