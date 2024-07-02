import 'package:architecture/domain/models/token/token.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_api_service.g.dart';

@RestApi()
abstract class RemoteApiService {
  factory RemoteApiService(Dio dio) = _RemoteApiService;

  @POST("/realms/ferag/protocol/openid-connect/token")
  @FormUrlEncoded()
  Future<Token> login({
    @Field("username") required String username,
    @Field("password") required String password,
    @Field("grant_type") required String grantType,
    @Field("client_id") required String clientId,
    @Field("client_secret") required String clientSecret,
  });

  @GET('/api/user/me')
  Future<User> fetchUser();
}
