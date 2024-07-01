import 'package:architecture/core/networking/api_response.dart';
import 'package:dio/dio.dart';

mixin ApiErrorHandler {
  Future<APIResponse<T>> executeApiCall<T>(Future<T> apiRequest,{bool login = false}) async {
    try {
      final result = await apiRequest;
      return APIResponse<T>(data: result, error: false);
    } on DioException catch (dioException) {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return APIResponse<T>(error: true, errorMessage: dioException.message ?? 'Error Timeout');

        case DioExceptionType.badResponse:
          String errorMessage = 'badResponse';
          if (dioException.response != null && dioException.response!.data != null) {
            final data = dioException.response!.data;
            if (dioException.response!.statusCode == 401 && login) {
              return APIResponse<T>(error: true, errorMessage: 'Unauthorized');
            } else if (data is Map<String, dynamic> && data.containsKey('message')) {
              errorMessage = data['message'];
              return APIResponse<T>(error: true, errorMessage: errorMessage);
            }
          }
          return APIResponse<T>(error: true, errorMessage: errorMessage);

        case DioExceptionType.connectionError:
          return APIResponse<T>(error: true, errorMessage: 'revise su conexion a internet');

        case DioExceptionType.unknown:
          return APIResponse<T>(error: true, errorMessage: dioException.message ?? 'error desconocido');

        default:
          return APIResponse<T>(error: true, errorMessage: dioException.message ?? 'error desconocido');
      }
    } catch (e) {
      return APIResponse<T>(error: true, errorMessage: 'error desconocido');
    }
  }
}
