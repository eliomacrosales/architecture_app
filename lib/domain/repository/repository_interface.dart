
import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/domain/models/token/token.dart';
import 'package:architecture/domain/models/user/user.dart';

abstract class RepositoryInterface {

  void updateDioHeaders(Map<String, dynamic> headers);
  void updateBaseURL(String baseUrl);


  Future<APIResponse<Token>> login({
    required String username,
    required String password,
    required String grantType,
    required String clientId,
    required String clientSecret,
  });

  Future<APIResponse<User>> fetchUser();


}
