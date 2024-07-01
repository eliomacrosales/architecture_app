import 'package:architecture/core/error_handler/api_error_handler.dart';
import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/core/networking/dio_client.dart';
import 'package:architecture/data/repository/remote_api_service/remote_api_service.dart';
import 'package:architecture/domain/models/token/token.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:architecture/domain/repository/repository_interface.dart';

class RepositoryImpl with ApiErrorHandler implements RepositoryInterface {
  late final RemoteApiService _service;
  DioClient? _dioClient;

  RepositoryImpl({required DioClient dioClient}) {
    _dioClient ??= dioClient;
    _service = RemoteApiService(_dioClient!.dio);
  }

  @override
  void updateDioHeaders(Map<String, dynamic> headers) {
    _dioClient!.updateHeader(headers);
  }

  @override
  void updateBaseURL(String baseUrl) {
    _dioClient!.updateBaseURL(baseUrl);
  }

  /// peticiones al API
  @override
  Future<APIResponse<Token>> login({
    required String username,
    required String password,
    required String grantType,
    required String clientId,
    required String clientSecret,
  }) async =>
      await executeApiCall(
          _service.login(
              username: username,
              password: password,
              grantType: grantType,
              clientId: clientId,
              clientSecret: clientSecret),
          login: true);

  @override
  Future<APIResponse<User>> fetchUser() async => await executeApiCall(_service.fetchUser());
}
